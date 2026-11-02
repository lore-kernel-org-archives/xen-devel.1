Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F400F606A327
	for <xen-devel@archiver.kernel.org>; Mon,  2 Nov 2026 10:10:30 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1468060.1677105 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNozR-0004EZ-L2; Mon, 02 Nov 2026 10:10:09 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1468060.1677105; Mon, 02 Nov 2026 10:10:09 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xNozR-0004ES-IO; Mon, 02 Nov 2026 10:10:09 +0000
Received: by outflank-mailman (input) for mailman id 1468060;
 Mon, 02 Nov 2026 10:10:07 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <lin.liu01@citrix.com>) id 1xNozP-0004EK-Op
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 10:10:07 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xNozO-00Gv9Z-Ub
 for xen-devel@lists.xenproject.org; Mon, 02 Nov 2026 11:10:06 +0100
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6ae86179-2eae-0a2a0a5409dd-0a2a450bc9a4-20
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 11:10:06 +0100
Received: from [160.101.131.9] (helo=na1pdmzitismtp02.tibco.com)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <lin.liu01@citrix.com>)
 id 6ae8617d-b7e8-0a2a450b0019-a0658309a534-3
 for <xen-devel@lists.xenproject.org>; Mon, 02 Nov 2026 11:10:06 +0100
Received: from cdev-nkg (unknown [10.113.40.46])
 by na1pdmzitismtp02.tibco.com (Postfix) with ESMTP id 29A8583AA556;
 Mon,  2 Nov 2026 05:09:01 -0500 (EST)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; none
From: Lin Liu <lin.liu01@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: Lin Liu <lin.liu01@citrix.com>,
	Bengang Yuan <bengang.yuan@citrix.com>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>
Subject: [PATCH] xen/credit: Uncount units dropped by csched_schedule()
Date: Mon,  2 Nov 2026 10:09:59 +0000
Message-ID: <01484673691f2ac609c09d2e57d8981910e87aa9.1793612017.git.lin.liu01@citrix.com>
X-Mailer: git-send-email 2.52.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-42698a/1793614206-1BAD09EA-10242995/0/0
X-purgate-type: clean
X-purgate-size: 2076
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

csched_schedule() takes snext off the runq without decrementing
nr_runnable, as it is about to run.  A unit that stops being runnable
is normally removed and uncounted by csched_unit_sleep(), but if the
pick loop drops it first, the sleep finds nothing to do and the unit
stays counted:

    CPU A                            CPU B
    domain_pause()                   csched_schedule(), lock held
      atomic_inc(&d->pause_count)
                                       __runq_remove(snext)
      vcpu_sleep_sync()                !unit_runnable_state(): drop
        waits for lock                 unlock
        csched_unit_sleep()
          not running, not queued:
          nothing to do
    domain_unpause()
      vcpu_wake()
        runq_insert()                nr_runnable +1 again

Decrement nr_runnable when dropping the unit.

Fixes: 7c7b407e7772 ("xen/sched: introduce unit_runnable_state()")
Reported-by: Bengang Yuan <bengang.yuan@citrix.com>
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Lin Liu <lin.liu01@citrix.com>
---
 xen/common/sched/credit.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/xen/common/sched/credit.c b/xen/common/sched/credit.c
index 8df746bf6b..f1a9b4aed1 100644
--- a/xen/common/sched/credit.c
+++ b/xen/common/sched/credit.c
@@ -1965,7 +1965,8 @@ static void cf_check csched_schedule(
         dec_nr_runnable(sched_cpu);
     }
 
-    do {
+    for ( ; ; )
+    {
         snext = __runq_elem(runq->next);
 
         /* Tasklet work (which runs in idle UNIT context) overrides all else. */
@@ -1993,7 +1994,12 @@ static void cf_check csched_schedule(
         else
             __runq_remove(snext);
 
-    } while ( !unit_runnable_state(snext->unit) );
+        if ( unit_runnable_state(snext->unit) )
+            break;
+
+        /* Dropped snext is off the runq but still counted: uncount it. */
+        dec_nr_runnable(sched_cpu);
+    }
 
     /*
      * Update idlers mask if necessary. When we're idling, other CPUs
-- 
2.52.0


