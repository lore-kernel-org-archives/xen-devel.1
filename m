Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FA6CA6002
	for <xen-devel@archiver.kernel.org>; Wed,  7 Oct 2026 15:46:54 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1442500.1660062 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xETqw-00046I-4S; Wed, 07 Oct 2026 15:46:46 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1442500.1660062; Wed, 07 Oct 2026 15:46:46 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xETqv-00045q-TI; Wed, 07 Oct 2026 15:46:45 +0000
Received: by outflank-mailman (input) for mailman id 1442500;
 Wed, 07 Oct 2026 15:46:44 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1170b94750003f66@swg.vates.tech>)
 id 1xETqt-0003wU-VE
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 15:46:43 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xETqt-008eFd-Bs
 for xen-devel@lists.xenproject.org; Wed, 07 Oct 2026 17:46:43 +0200
Received: from [10.42.69.11] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1170b94750003f66@swg.vates.tech>)
 id 6ac66961-8faa-0a2a0a5109dd-0a2a450ba5ac-16
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 17:46:43 +0200
Received: from [185.255.28.34] (helo=prod-mta-13-01.swg-srv.net)
 by tlsNG-42698a.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a1170b94750003f66@swg.vates.tech>)
 id 6ac66960-b7e8-0a2a450b0019-b9ff1c22902f-5
 for <xen-devel@lists.xenproject.org>; Wed, 07 Oct 2026 17:46:43 +0200
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-01.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a1170b94750003f66.001 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Wed, 07 Oct 2026 15:46:37 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie@vates.tech)
 by mail2.vates.fr (Postfix) with ESMTPSA id C3B6482191;
 Wed,  7 Oct 2026 17:46:36 +0200 (CEST)
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
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:In-Reply-To:References:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=eBAH3WHU7ZzQ413sxtWXDDZRko1V52GT0XqzM+g0T2k=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:in-reply-to:references:feedback-id;
 b=ax3WEjv60t3eid6ewZTic5EZ9XxJ03pMtZSJolrpN8NyQv5PD4a6UM3q+7ULIkNa41lXggMEA
 KROBKyWUOrxGJIv6Dmp6a28j37/QWWPaoSSHLktYbV5t+SXxV2ES6Isv7fxrHyRhQzZokPuKcwY
 Eu7Be1X2vI43RRnEjMwRhb5wGyER+VaI5Vq9W1Ke5SWxhGcLD0nAeKwdtcyruNTtr3NM9cTsEVC
 3ieRWpyLnttE/M6kqKncIU9GQfsr1Vr4TlIi2IkzJXURAtZte8KRL2ISp4H5r7Ch7J+LS18Tk8B
 i53x71476nEbASeDNAoiM29hTUxiHGA5YHsrU6rmqJZA==
X-Zone-Loop: 16fc0de5a55e8e88e2df1ac9b3b220e89446d566fa04
x-campaign-type: default
x-transaction-id: 00bd7085-32a3-47ce-b74b-5fa51080fa23
x-swg-uid: 01-f907e347-9c60-4d98-9b0d-7b7f83ad6041
X-Mailer: Sweego
Message-ID:
 <1791387997.8631fc262581453bbf619ec5b2062170.1a1170b94750003f66@vates.tech>
x-swg-bid: 1791387997.8631fc262581453bbf619ec5b2062170.1a1170b94750003f66
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
X-Originating-IP: [37.26.189.201]
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Anthony PERARD <anthony.perard@vates.tech>
Subject: [RFC PATCH 3/4] xl: Expose CPU status map with 'xl info -m'
Date: Wed,  7 Oct 2026 17:46:05 +0200
In-Reply-To: <20261007154607.119543-2-teddy.astie@vates.tech>
References: <1791387811.8631fc262581453bbf619ec5b2062170.1a11708bf380003f66@vates.tech>
 <20261007154607.119543-2-teddy.astie@vates.tech>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.704.b4aaaba915cd2de1.1a1170b92d9.263815be9e54d56a=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1791387996889
X-purgate-ID: tlsNG-42698a/1791388003-AAEDE9EA-A89D8D7A/0/0
X-purgate-type: clean
X-purgate-size: 3629

---=Part.704.b4aaaba915cd2de1.1a1170b92d9.263815be9e54d56a=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Teddy Astie <teddy=2Eastie@vates=2Etech>
---
 tools/xl/xl_cmdtable=2Ec |  4 +++-
 tools/xl/xl_info=2Ec     | 46 ++++++++++++++++++++++++++++++++++++++----
 2 files changed, 45 insertions(+), 5 deletions(-)

diff --git a/tools/xl/xl_cmdtable=2Ec b/tools/xl/xl_cmdtable=2Ec
index 502244f683=2E=2E68caafd5bd 100644
--- a/tools/xl/xl_cmdtable=2Ec
+++ b/tools/xl/xl_cmdtable=2Ec
@@ -261,7 +261,9 @@ const struct cmd_spec cmd_table[] =3D {
     { "info",
       &main_info, 0, 0,
       "Get information about Xen host",
-      "-n, --numa         List host NUMA topology information",
+      "[options]",
+      "-n, --numa         List host NUMA topology information\n"
+      "-m, --map          Show CPU status map"
     },
     { "sharing",
       &main_sharing, 0, 0,
diff --git a/tools/xl/xl_info=2Ec b/tools/xl/xl_info=2Ec
index 98fc879e63=2E=2Ebed8996c9b 100644
--- a/tools/xl/xl_info=2Ec
+++ b/tools/xl/xl_info=2Ec
@@ -420,7 +420,39 @@ static void output_xenstore_info(void)
     xs_close(xsh);
 }
=20
-static void print_info(int numa, bool xs)
+static void output_cpumap(void)
+{
+    int nr, i;
+
+    libxl_cpu_status_map *cpu_status_map =3D libxl_get_cpu_status_map(ctx=
, &nr);
+    if (!cpu_status_map) {
+        fprintf(stderr, "libxl_get_cpu_status_map failed=2E\n");
+        return;
+    }
+
+    printf("CPU statuses\n");
+   =20
+    for (i =3D 0; i < nr; i++) {
+        const char *status =3D "None";
+        bool online =3D libxl_bitmap_test(&cpu_status_map->cpu_online_map=
, i);
+        bool present =3D libxl_bitmap_test(&cpu_status_map->cpu_present_m=
ap, i);
+        bool possible =3D libxl_bitmap_test(&cpu_status_map->cpu_possible=
_map, i);
+
+        if (online)
+            status =3D "Online";
+        else if (present)
+            status =3D "Offline (Present)";
+        else if (possible)
+            status =3D "Offline (Possible)";
+
+        printf(" %d: %s\n", i, status);
+    }
+
+    libxl_cpu_status_map_dispose(cpu_status_map);
+    free(cpu_status_map);
+}
+
+static void print_info(int numa, bool xs, bool cpu_map)
 {
     output_nodeinfo();
=20
@@ -430,6 +462,8 @@ static void print_info(int numa, bool xs)
         output_topologyinfo();
         output_numainfo();
     }
+    if (cpu_map)
+        output_cpumap();
     output_xeninfo();
=20
     if (xs)
@@ -732,18 +766,22 @@ int main_info(int argc, char **argv)
     static struct option opts[] =3D {
         {"numa", 0, 0, 'n'},
         {"xenstore", 0, 0, 'x'},
+        {"map", 0, 0, 'm'},
         COMMON_LONG_OPTS
     };
     int numa =3D 0;
-    bool xs =3D false;
+    bool xs =3D false, cpu_map =3D false;
=20
-    SWITCH_FOREACH_OPT(opt, "nx", opts, "info", 0) {
+    SWITCH_FOREACH_OPT(opt, "nxm", opts, "info", 0) {
     case 'n':
         numa =3D 1;
         break;
     case 'x':
         xs =3D true;
         break;
+    case 'm':
+        cpu_map =3D true;
+        break;
     }
=20
     /*
@@ -753,7 +791,7 @@ int main_info(int argc, char **argv)
     if (numa =3D=3D 0 && argc > optind)
         info_name =3D argv[optind];
=20
-    print_info(numa, xs);
+    print_info(numa, xs, cpu_map);
     return 0;
 }
=20
--=20
2=2E55=2E0



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.704.b4aaaba915cd2de1.1a1170b92d9.263815be9e54d56a=---

