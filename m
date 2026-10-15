Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA250CC6B33
	for <xen-devel@archiver.kernel.org>; Thu, 15 Oct 2026 12:05:59 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1450302.1665800 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKDU-0005UK-MP; Thu, 15 Oct 2026 12:05:48 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1450302.1665800; Thu, 15 Oct 2026 12:05:48 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xHKDU-0005Tu-ID; Thu, 15 Oct 2026 12:05:48 +0000
Received: by outflank-mailman (input) for mailman id 1450302;
 Thu, 15 Oct 2026 11:54:36 +0000
Received: from mx.expurgate.net ([195.190.135.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <msd-xenproject.org@msd.im>) id 1xHK2e-0008SW-4O
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 11:54:36 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xHK2d-002Icz-DN
 for xen-devel@lists.xenproject.org; Thu, 15 Oct 2026 13:54:35 +0200
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <msd-xenproject.org@msd.im>)
 id 6ad0bef6-2eae-0a2a0a5409dd-0a2a45078606-12
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 13:54:34 +0200
Received: from [87.98.178.58] (helo=17.mo561.mail-out.ovh.net)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <msd-xenproject.org@msd.im>)
 id 6ad0befa-b4ea-0a2a45070019-5762b23aa18d-3
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 13:54:34 +0200
Received: from director3.ghost.mail-out.ovh.net (unknown [10.110.58.129])
 by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4j561k2PcVz60Qp
 for <xen-devel@lists.xenproject.org>; Thu, 15 Oct 2026 11:54:34 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-5vnxl (unknown [10.111.174.161])
 by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id ED105C04CB;
 Thu, 15 Oct 2026 11:54:33 +0000 (UTC)
Received: from msd.im ([37.59.142.103])
 by ghost-submission-7ccd8bbbb6-5vnxl with ESMTPSA
 id I7lrKfm+0GqLRAAAi6cUng
 (envelope-from <msd-xenproject.org@msd.im>); Thu, 15 Oct 2026 11:54:33 +0000
Received: from mail.msd.im (unknown [192.168.1.32])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by msd.im (Postfix) with ESMTPSA id BB7FB20088;
 Thu, 15 Oct 2026 13:54:32 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=msd001 header.d=msd.im header.i="@msd.im" header.h="Date:From:Subject:To:Cc"
Authentication-Results:garm.ovh; auth=pass (GARM-103G00513f120ed-6eae-421a-bfcc-7fc479540065,
                    71189ECCCFDEC51F476E72D41DA47BE09842BDA6) smtp.auth=massedil@msd.im
X-OVh-ClientIp:2.12.250.155
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=msd.im; s=msd001;
	t=1792065272; bh=fvv3/k0ooz9Ete/etMooXYP7y0WAKHQyPHKVMxH8oQY=;
	h=Date:From:Subject:To:Cc:From;
	b=JuE1SI/D2G1EZ4mYtLVLeX20O29Yiu5YrGq2Af4/Dp0XtgU4atQi0gjtnUlhGnuUY
	 dauL2HzZct0bb3SyktnpHriAwwv0I87l24/hQJ9dMH7L9Ygj5fruFGFGcN4iRJg1Kj
	 FKysxdm3XqyOBw3PgDxLfn/K2CzUB0y60LlobFdOkuz5sMGA+L9tnQJ7vPlfwIFRxF
	 KU5V1j9iPSLPjYRmYlb8uQm3Y/faLQN2kH3gKojCdVzHFhrdaDRFyo+oaFdN4clLwX
	 iLtlka7MtfHReeZEU5SGdO0pGXphzMJxR2fsHPPFgdd4Q1Rc+gEqkNHPoc9PceFu6l
	 4EfFr+fXLNKkw==
MIME-Version: 1.0
X-Mailer: SnappyMail/2.36.4
Date: Thu, 15 Oct 2026 11:54:32 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
From: msd-xenproject.org@msd.im
Message-ID: <f3903a460fe11aed021d962dcc1d0ac6b30286dd@msd.im>
TLS-Required: No
Subject: [BUG] libxl: `xl shutdown ""` powers off the host
To: xen-devel@lists.xenproject.org
Cc: anthony.perard@vates.tech, jgross@suse.com
x-ovh-tracer-id: 13761311612377987032
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTFRz6qPYde7IaFNSXlgYqpRwqp/tFhmSwns9NJWoIbrEpE3CIu33jzvX+PUmmsVsKMP7eXP+/WtNSUBUliRzTUkdOMv14XoOPfDNTjUuo2p0zibMD7LE2KIrxUF5pkyHU1lO8edlKnLOumNuwWOYAxmXS19F05i4gXIBb775y4PcKzPD1QC8D1lgexH9Tu8pglZBGLgvG2lIB8U9ob58gqd9d+uLdpu2fU8PDn5CSN3eWFzI7VadOFEyIx9np2XqdmMrG0M1/FdykXVX1OdKTFWxBKqN0TNXDA5F2ulc1ZnxotlXy0GoLqyzfl97ASe03bJV2CSkSrF5Jg59M4VxudhmiuyG7rIj2sWSHFg76CoIUNFaPX5nkWBjVBJBcq9o+YKGo908eluuPXi6nTisrvvZdBvQBPoyG6pnltcKH7u25QqzmfoFtp+eINWLg62ToRqfMUqYg8rZS2UEIYznjWyo/rXKMxUUSXckgotj9JpSj0QTtWL3h0EzApv7oArsU9j8q0GmebBLTUZmA91TdLo+93vwrMGBEQ8Sr1MWVxptLEGuciPjxCbzJqsIzMkRw9CkuiBkECRnemym6CRPeV4zaGYBV87N5jXLmzQE45gNnElfecqMrz/9CO/ckN3ph/RRrjPTaZNFO9FgpkX0hpsJ8kx2a8DJdE5Lcyl+O2dlQ
X-purgate-ID: tlsNG-ef75cf/1792065274-A7ED6AE4-91379726/0/0
X-purgate-type: clean
X-purgate-size: 2685

Hi,

An empty domain qualifier seems silently resolved to domain 0,=20
so=20a command such as :

    xl shutdown ""

does not fail with an error: it shuts down dom0, which powers off the
whole host.

Impact
------

We ran `xl shutdown ""` on a Debian host running Xen 4.20.=20
Instead=20of printing an "invalid domain identifier" error, xl asked dom0=
 to shut down, and the
physical server powered off, taking every guest down with it.

The same input is easy to produce by accident, for example from a shell
script with an unset variable:

    xl shutdown "$VM"     # VM is empty or unset

The diagnostic and patch is proposed assisted by Anthropic Claude.=20
I=20haven't tested it, it was generated when I was trying to understand i=
f the shutdown behavior is normal.
I just hope it will help you understanding faster.


Cause (Anthropic Claude)
------------------------

In tools/libs/light/libxl_utils.c:

    int libxl_domain_qualifier_to_domid(libxl_ctx *ctx, const char *name,
                                        uint32_t *domid)
    {
        int i, rv;
        for (i=3D0; name[i]; i++) {
            if (!CTYPE(isdigit, name[i])) {
                goto nondigit_found;
            }
        }
        *domid =3D strtoul(name, NULL, 10);
        return 0;
        ...

With name =3D=3D "", the loop body never runs, so the string is treated a=
s
"all digits". strtoul("", NULL, 10) returns 0 without any error
detection, and the function returns success with *domid =3D=3D 0.
find_domain() in tools/xl/xl_utils.c then sees rc =3D=3D 0 and carries on
with domid 0.

Every xl subcommand that resolves its argument through find_domain()
(destroy, reboot, pause, ...) is affected in the same way.


Proposed fix (Anthropic Claude)
-------------------------------

Reject the empty string up front, using the same error code as
libxl_name_to_domid() already uses for an unknown name.

--- a/tools/libs/light/libxl_utils.c
+++ b/tools/libs/light/libxl_utils.c
@@ -92,6 +92,10 @@ int libxl_domain_qualifier_to_domid(libxl_ctx *ctx, co=
nst char *name,
                                     uint32_t *domid)
 {
     int i, rv;
+
+    if (!name[0])
+        return ERROR_INVAL;
+
     for (i=3D0; name[i]; i++) {
         if (!CTYPE(isdigit, name[i])) {
             goto nondigit_found;

With this, `xl shutdown ""` prints:

    "" is an invalid domain identifier (rc=3D<ERROR_INVAL>)

and exits with EXIT_FAILURE, without touching dom0.

(The line numbers in the hunk header are approximate; We have not built
or tested the patch.)


--

What do you think about it ?

Regards,

Msd

