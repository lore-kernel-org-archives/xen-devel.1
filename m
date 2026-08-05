Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2907CC55ABA
	for <xen-devel@archiver.kernel.org>; Wed,  5 Aug 2026 13:55:42 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1383529.1626805 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrc5g-0005yB-UH; Wed, 05 Aug 2026 13:55:28 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1383529.1626805; Wed, 05 Aug 2026 13:55:28 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1wrc5g-0005y4-Rc; Wed, 05 Aug 2026 13:55:28 +0000
Received: by outflank-mailman (input) for mailman id 1383529;
 Wed, 05 Aug 2026 13:55:28 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <matthias.goergens@gmail.com>) id 1wrc5f-0005xy-TG
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 13:55:28 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1wrc5e-00FCef-Va
 for xen-devel@lists.xenproject.org; Wed, 05 Aug 2026 15:55:26 +0200
Received: from [10.42.69.9] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <matthias.goergens@gmail.com>)
 id 6a7340c7-2eae-0a2a0a5409dd-0a2a4509e32c-18
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 15:55:26 +0200
Received: from [209.85.160.51] (helo=mail-oa1-f51.google.com)
 by tlsNG-bad1c0.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <matthias.goergens@gmail.com>)
 id 6a7340cd-be1a-0a2a45090019-d155a033c9d9-3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 15:55:26 +0200
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-44cedfaab6bso490880fac.3
 for <xen-devel@lists.xenproject.org>; Wed, 05 Aug 2026 06:55:26 -0700 (PDT)
Received: from spider.bream-herring.ts.net ([103.252.203.158])
 by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-4599e5b7ec1sm2484235fac.12.2026.08.05.06.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Aug 2026 06:55:24 -0700 (PDT)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=20251104 header.d=gmail.com header.i="@gmail.com" header.h="Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785938125; x=1786542925; darn=lists.xenproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u4KVtir626gFVd35a54C+CtXHXFocgfKtNH4N3LL1vI=;
        b=JelmxEaNquBW0vHspdLQnmoyvaRtvZC5kJhF2vKJAh3lmmnqknhgRy0DfydtS+7lpw
         RLypQpMZ0P/NC21jZtiFS3aal+wq/Cs+9Yx3YRjLPiIDi22t0OGkUcrgKuAKPVews5NM
         oxkd96wLeMw5ZDDTwLfu6DTH/9dXthe/f8Fwl0F6G+3vJ0h9gp+S+wLAQT1+8ZQTD+xb
         wX2ckwP4EKVGbimyevz8/Cr8RrPLSy4HyzOIiR85BFGlMGJNjY4r5TMvER9pxArTX0na
         oo/r3OZpRm5LlO69QZYbJ0r5AmuchBCs/pHikRieSNQjAgK6I5AVwvOxCsVWJRAYrm+d
         EEYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785938125; x=1786542925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u4KVtir626gFVd35a54C+CtXHXFocgfKtNH4N3LL1vI=;
        b=XyREivLMG9eqnoRmjbt5dHNUQXuJb/ixs1KnnvTmbaHTeTrAx+UTuRtXikFsJcULh1
         4pyqdCCF1Q2AmiZkU7/k3/w42XN0kLhFD/ORd7su8PXGO/W9V/WPFFHoMqt2klB86Wwi
         U44jUc4QZ9YNtYX6volaiLVYbEY2jEUxJgLsUkYGuZYImULeW+wSdrezay+mbjcgEAx3
         sSBnfxB3XQSCDhEMrEPf+6mmCwM0nTDSD+ZmHy8iUMhT6SuhsRWXk5gRkA6ewWuU4J5z
         vm8rfRO7Jjrw40h690Z29i/hgcfPXg0mRoC/If9KgTmbd+UK1tdaAICJhsVgqA/kdIKc
         0DdA==
X-Gm-Message-State: AOJu0Yy7XVuu4JkGgf32zIhMoQ2tgwGFrUubpKPSYxCPfKwD8QhWG1kF
	bzGrugBHUjkcx/sIVqKr8ocY+qcWJbzEKVK0EPOLo+nGjlDz+gDAT/Pabz4oa0Mb
X-Gm-Gg: AR+sD11NSSRAs/plcZ9++WU4ozN2j0rfHABBHWtzhO3E6+x0CqoZ/vtB6u6So+emLcD
	Ssl1P/p6bGT9UDvAiQ0/oQgtJl//xZe+Nr9IFZyyoFWIY1DafYRfnfCfL2GyPzY4GM9bzcECMjG
	CIGBUVoRC0tZqF0dISCbPg2G+8fqn65MzA3ekqYL+dCqFwA6WMMc+YmzHONWXJvJRhHRPSw/Rlg
	L+Vord9tTYVZsKAQfRoDgE0dsPK6gIWNweordpApAqo+wj4sKYnpUz5dPA16mxjAl2ygXQYsyd3
	9xj0jd6KuaZW1OSN7k6w9BGILPwxTYhxAyio+cPpwp1lo81kAdyRFUWEjo8L5tH9L+BINPtwBB5
	vNCCQHbsewo8QW8x5o+VMihHLncfoYh65YQNurrNRA6rXof9ZQQV75GrIyakthFFUn6g5fP1/9z
	AIBULk0fczEBmjgGAYtd0kj+8U1cFyLJW5UfPmnhlfEbILomznxMZ0um2j9CJmRwVUM5EY/vM10
	NiSSd/keUfDxYJ4d19yWOt/zCqF8Dx3i9SF1lq9wAF5q0dY4UDUWDp51ktknfZJ5lVhlbutgOXK
	1GCxfuAwiRLaIBybYjkbiTUIUwWPPJDaCiUJ0dJbs6U/KlecdWuf42LqgoG15YqF
X-Received: by 2002:a05:6871:7996:b0:448:aaaa:6b93 with SMTP id 586e51a60fabf-4599f1246bamr3533288fac.17.1785938125108;
        Wed, 05 Aug 2026 06:55:25 -0700 (PDT)
From: Matthias Goergens <matthias.goergens@gmail.com>
To: xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech,
	Matthias Goergens <matthias.goergens@gmail.com>
Subject: [PATCH] tools/xentop: reject invalid --delay and --iterations arguments
Date: Wed,  5 Aug 2026 21:55:21 +0800
Message-ID: <20260805135521.790750-1-matthias.goergens@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-purgate-ID: tlsNG-bad1c0/1785938126-BE4DB034-15ED710E/0/0
X-purgate-type: clean
X-purgate-size: 4483

xentop parses -d/--delay and -i/--iterations with atoi(), so invalid
input is silently accepted with surprising results: a fractional delay
such as "-d 2.5" is truncated to 2; "-d abc" parses as 0, which in
batch mode turns the output loop into a busy loop; "-d -1" wraps to an
effective delay of about 136 years; and "-i 0" (or any unparsable
iterations count) decrements an unsigned counter from zero, running
for about 2^32 iterations.  atoi() also has undefined behaviour on
out-of-range input.

Parse both options with strtoull() instead, and reject anything that
is not a plain decimal integer in range: a sign, a fractional part,
trailing junk or overflow now produce an error and exit rather than a
silently wrong value.

Compatibility considerations: "--delay 0" remains accepted, since
updating as fast as possible is a plausible deliberate choice and
works today; "--iterations 0" is rejected, since running the loop
2^32 times cannot be what the caller meant.  The interactive 'D'
prompt already validates its input and is unchanged.  The only
previously useful invocation this breaks is a fractional delay, which
now fails loudly instead of silently rounding down - which is the
point of the change.

A patch documenting the --delay truncation was posted in 2010 but
never applied:
Link: https://lore.kernel.org/xen-devel/01ea26d2420e3562eb30.1292604768@chilopoda.uk.xensource.com/

Signed-off-by: Matthias Goergens <matthias.goergens@gmail.com>
---
Tested by compiling with -Wall -Wextra (no new warnings) and by running
the parse helper, extracted verbatim from the patched file, against a
19-case input matrix covering both the accepted and the rejected inputs
listed above.  Not run against a live Xen host: the change is confined
to command line parsing, ahead of any hypervisor interaction.

Happy to add a CHANGELOG.md entry under "Changed" if that is wanted for
a tools CLI change of this size.

 docs/man/xentop.1.pod |  5 +++--
 tools/xentop/xentop.c | 27 +++++++++++++++++++++++++--
 2 files changed, 28 insertions(+), 4 deletions(-)

diff --git a/docs/man/xentop.1.pod b/docs/man/xentop.1.pod
index db64ceb..13f3f13 100644
--- a/docs/man/xentop.1.pod
+++ b/docs/man/xentop.1.pod
@@ -27,7 +27,7 @@ output version information and exit
 
 =item B<-d>, B<--delay>=I<SECONDS>
 
-seconds between updates (default 3)
+seconds between updates (default 3); must be a non-negative integer
 
 =item B<-n>, B<--networks>
 
@@ -55,7 +55,8 @@ output data in batch mode (to stdout)
 
 =item B<-i>, B<--iterations>=I<ITERATIONS>
 
-maximum number of iterations xentop should produce before ending
+maximum number of iterations xentop should produce before ending; must
+be a positive integer
 
 =item B<-z>, B<--dom0-first>
 
diff --git a/tools/xentop/xentop.c b/tools/xentop/xentop.c
index addb1c7..c7fb4ca 100644
--- a/tools/xentop/xentop.c
+++ b/tools/xentop/xentop.c
@@ -23,6 +23,7 @@
 
 #include <ctype.h>
 #include <errno.h>
+#include <limits.h>
 #include <math.h>
 #include <stdio.h>
 #include <stdlib.h>
@@ -1297,6 +1298,28 @@ static void signal_exit_handler(int sig)
 	signal_exit = 1;
 }
 
+/* Parse a numeric command line argument as a plain decimal integer no
+ * smaller than min_val.  Anything else - a sign, a fractional part,
+ * trailing junk, overflow - is fatal, rather than being silently
+ * accepted as a wrong value the way atoi() would.
+ */
+static unsigned int parse_uint_arg(const char *name, const char *arg,
+				   unsigned int min_val)
+{
+	unsigned long long val;
+	char *end;
+
+	errno = 0;
+	if (isdigit((unsigned char)arg[0])) {
+		val = strtoull(arg, &end, 10);
+		if (!errno && !*end && val >= min_val && val <= UINT_MAX)
+			return val;
+	}
+	fprintf(stderr, "xentop: invalid %s argument '%s': expected a %s decimal integer\n",
+		name, arg, min_val ? "positive" : "non-negative");
+	exit(1);
+}
+
 int main(int argc, char **argv)
 {
 	int opt, optind = 0;
@@ -1347,7 +1370,7 @@ int main(int argc, char **argv)
 			show_vcpus = 1;
 			break;
 		case 'd':
-			delay = atoi(optarg);
+			delay = parse_uint_arg("--delay", optarg, 0);
 			break;
 		case 'b':
 			batch = 1;
@@ -1356,7 +1379,7 @@ int main(int argc, char **argv)
 			show_pcpus = 1;
 			break;
 		case 'i':
-			iterations = atoi(optarg);
+			iterations = parse_uint_arg("--iterations", optarg, 1);
 			loop = 0;
 			break;
 		case 'f':
-- 
2.55.0


