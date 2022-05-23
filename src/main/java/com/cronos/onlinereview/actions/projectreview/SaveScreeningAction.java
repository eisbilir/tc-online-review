/*
 * Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
 */
package com.cronos.onlinereview.actions.projectreview;

import com.cronos.onlinereview.util.LoggingHelper;
import com.topcoder.onlinereview.component.exception.BaseException;
import com.topcoder.servlet.request.ConfigurationException;
import com.topcoder.servlet.request.DisallowedDirectoryException;
import com.topcoder.servlet.request.PersistenceException;
import com.topcoder.servlet.request.RequestParsingException;

/**
 * This class is the struts action class which is used to save the screening.
 * <p>
 * <b>Thread Safety:</b>Struts 2 Action objects are instantiated for each request, so there are no thread-safety issues.
 * </p>
 *
 * @author TCSASSEMBLER
 * @version 2.0
 */
public class SaveScreeningAction extends BaseProjectReviewAction {

    /**
     * Represents the serial version id.
     */
    private static final long serialVersionUID = -8031115199623800104L;

    /**
     * This method is an implementation of &quot;Save Screening&quot; Struts Action defined for this
     * assembly, which is supposed to save information posted from /jsp/editReview.jsp page. This
     * method will either create new screening or update (edit) an existing one depending on which
     * action was called to display /jsp/editReview.jsp page.
     *
     * @return &quot;success&quot;, which forwards to the &quot;View Project Details&quot;
     *         action, or &quot;userError&quot; forward, which forwards to the /jsp/userError.jsp
     *         page, which displays information about an error that is usually caused by incorrect
     *         user input (such as absent submission id, or the lack of permissions, etc.).
     * @throws BaseException
     *         if any error occurs.
     */
    public String execute() throws BaseException, ConfigurationException, PersistenceException, RequestParsingException, DisallowedDirectoryException {
        LoggingHelper.logAction(request);
        return saveGenericReview(getModel(), request, "Screening");
    }
}

