Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A407606A31A
	for <xen-devel@archiver.kernel.org>; Mon, 26 Oct 2026 09:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=citrix.com header.i=@citrix.com header.a=rsa-sha256 header.s=selector1 header.b=qTGY43ut
Received: from list by lists.xenproject.org with outflank-mailman.1460920.1671822 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGqM-00074I-19; Mon, 26 Oct 2026 09:18:14 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1460920.1671822; Mon, 26 Oct 2026 09:18:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xLGqL-00074A-TR; Mon, 26 Oct 2026 09:18:13 +0000
Received: by outflank-mailman (input) for mailman id 1460920;
 Mon, 26 Oct 2026 09:18:12 +0000
Received: from mx.expurgate.net ([194.145.224.20])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <kevin.lampis@citrix.com>) id 1xLGqK-0006zX-DN
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 09:18:12 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xLGqJ-003mGA-Q6
 for xen-devel@lists.xenproject.org; Mon, 26 Oct 2026 10:18:11 +0100
Received: from [10.42.69.7] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6adf1ac6-bab6-0a2a0a5309dd-0a2a4507d31c-48
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:18:11 +0100
Received: from [52.101.56.40]
 (helo=BN1PR04CU002.outbound.protection.outlook.com)
 by tlsNG-ef75cf.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <kevin.lampis@citrix.com>)
 id 6adf1acc-b4ea-0a2a45070019-3465382892ea-3
 for <xen-devel@lists.xenproject.org>; Mon, 26 Oct 2026 10:18:05 +0100
Received: from BY1PR03MB7996.namprd03.prod.outlook.com (2603:10b6:a03:5b2::8)
 by SJ0PR03MB6518.namprd03.prod.outlook.com (2603:10b6:a03:38e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 09:18:03 +0000
Received: from BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07]) by BY1PR03MB7996.namprd03.prod.outlook.com
 ([fe80::5068:e1b5:b478:8d07%3]) with mapi id 15.21.0546.021; Mon, 26 Oct 2026
 09:18:02 +0000
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=citrix.com header.i="@citrix.com" header.h="From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jxcLzP4Q6ej5D5k75coi8/S1tSQvbVBBRZkSoC+KY577M1EVgZlnkRZyNhNv21z+6eiyQovMj0QqFVdwGaZKMwE7vGIoPK0aWMizocqZG2+vWFBoKBlV9q4OONhxj9Fbmz3aS/neOi9t9I+tGj4Zi3m64xCaNeGW7WB3GulRj4GSUWycLhaoQ3mv+w8gfxVup0FspdY328MFAD2D+WTCUQxxqH+hA9LZeqHidB8xDXxVk+4whtLm5WgDcyPhTVUdtnKW4UDmZmqn3Dmgu6uu+5yyyObVHoXHF0elS9aQ0RJPtUKiJaPjnW5I/hxZAKkzuDCJYPpInKu5xQ32qmmiIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mIaXzZ88ptf5Jemx1JWKT89PyZkADCbFMZY+QLrAMTg=;
 b=FjTsZ2tlUQZcFpKi/OwsyBxofryGHnwrHKnWPeoKcfkORludvU3U8fyXpQEO83NMudBxD+Avj0jqPURgzYfjsPKOAsf1yCWLunqncWCXOgisM9KeEWE5HX1gDPypMd3flK5pQOVDN+nN72uIaBjSX40zjU3oW+q3c6z0FQbmc5sRdfaZh30JntUfGp5WmDvGLyEcR3vYHaCkAItKY/ofuLCw35St1fpLryHqXv/FnGxGCNedNUgUPOPbr/m4cmcbvz/6k5HWf7ac7EWSMoCUs9+QrshNWx0bAjXw/Fc8cyiqCk7t6qHOOkxEaIJ0IYlU4wRAuiHMjSUr5IyZ+0GMZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=citrix.com; dmarc=pass action=none header.from=citrix.com;
 dkim=pass header.d=citrix.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=citrix.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mIaXzZ88ptf5Jemx1JWKT89PyZkADCbFMZY+QLrAMTg=;
 b=qTGY43utJBkFcBdtBXY3dLRCZHlS3fLxVvkNc9jyFFAAM77ZM0jhigwan0axyNbwGwPACcvsGKM8Y9J/yjRjE8gWnzSu5ZyUyLBwjgWA7A83XnrDs//horuuPpnAI1upWzhYMHo9Fvd011XjS0EF8Yd4zf8zzPtwei6znBkXbeE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=citrix.com;
From: Kevin Lampis <kevin.lampis@citrix.com>
To: xen-devel@lists.xenproject.org
Cc: jbeulich@suse.com,
	andrew.cooper3@citrix.com,
	roger@xenproject.org,
	teddy.astie@vates.tech,
	ross.lagerwall@citrix.com,
	Kevin Lampis <kevin.lampis@citrix.com>
Subject: [PATCH v3 5/7] x86/kexec: Implement new EFI load type
Date: Mon, 26 Oct 2026 09:20:15 +0000
Message-ID: <20261026092017.3880869-6-kevin.lampis@citrix.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20261026092017.3880869-1-kevin.lampis@citrix.com>
References: <20261026092017.3880869-1-kevin.lampis@citrix.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: LO4P265CA0021.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2ae::22) To BY1PR03MB7996.namprd03.prod.outlook.com
 (2603:10b6:a03:5b2::8)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PR03MB7996:EE_|SJ0PR03MB6518:EE_
X-MS-Office365-Filtering-Correlation-Id: 9044d93c-e194-4241-c2d4-08df33420957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|1800799024|261009223027099003|261021121427099003|261022075727099003|261022115727099003|261022105027099003|261021135927099003|261021123027099003|10067099003|56012099006|3023799007|6133799003|18002099003|22082099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	YfZ/Yqssc7Bvai7Nw5SJ897ylLpUXIC6gIcuaAaXcSCQQ/Iejtq7pLNiRdUxvxgh6LNc1I6lusnhcKg9a87O4IuV8k/Ol02oupl3ehxmTjMJ03auDgVJXrYA+cOwnPuoNc9h2EiLJZt/8Gto1xQftmnS1kM27XnfNn1BpkdQx1+Dt4Bu57DYCc09gcLzC2AJQr+muwMSIUOhqAhk7EcbSi9eaux1xIqWystUWSrwjRw3jsowDb305ZCB2y5r3Fnbf03ITm59PgRDvJw5myzrDph8F5nxgB0/DitBmV12oE1KA6fw4FZRtLl4P3WVBbNnm5UcI/JRY1jtdx1CXyAcSXa5ikI6CZT0uo0QJmGWtQ4uOY6aiZUiJYJ2PrC5fPazDZS4y0RBKyB2cyCZ4vEsNlozrQ8OvGiK0PqfdDv/FUQlbyOn2u5rcYy5ygd5vvZ7gEMTTQCVzvJ+iEGR6uSvMJppLAKYx7LRjhYshi5klrm/3QOV1V/yNRIZ4z6eTYoTuZSoZebBoghkjootmtEx62iEQtrNEqEq8iEPVpR8hm2oDA/OCL/kNZhRT4PX+xPWsMxBqGhKi1dIznPslwaf++MeP8bO9Xq3SUW/RyEWyzl4cXEolMFYZGlv9IYDuRZAf0J3WZNs0MSYJZaq/ou0YSt5zpK6dft1EoDUNvDaZ3E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY1PR03MB7996.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(1800799024)(261009223027099003)(261021121427099003)(261022075727099003)(261022115727099003)(261022105027099003)(261021135927099003)(261021123027099003)(10067099003)(56012099006)(3023799007)(6133799003)(18002099003)(22082099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?96VLbpxs/X0An9OejG0mlbP4hp5CXZcAx1sCr/IxBbG2dZo6vnQFCLzACrJ5?=
 =?us-ascii?Q?vZB49+5O+kMO8kXqLz54vPbG4SRk45M8v8o/wVNOTW0ylRv7HjzbAhL1pWug?=
 =?us-ascii?Q?oqrXh0ooDfNp8/mIgsS6GHoSBfet7bbYKBLTUGML7CeGz3eHbrL8gZAXPXK6?=
 =?us-ascii?Q?PBa0Rout81AE7/F6khj0X88MHo+cgHzi1Jr/3ZSoxjWBRrxzptsvTU9FzY3r?=
 =?us-ascii?Q?Fiur+/Tb5UZDRZAxUSMOPX1km68dJfbwZ898en/9oFD14WI4brZ+bHqqolkp?=
 =?us-ascii?Q?fWpt9RrU5CpLO3lincb039rQ0tOWbLwMQEyXp7sGWJXta60SWPbmwmniGj92?=
 =?us-ascii?Q?PTv8AVxnEHm1kTKqhXd/JNfq6dMbnqvS3qxNoThXmqVgbE6dRGNFU/7aLkwC?=
 =?us-ascii?Q?kvOQPcqGw5lPkQzkQ0PPLkyu4nsID8k3H04MVKVC2eBtsimmvm+miYUD9Y8I?=
 =?us-ascii?Q?QaGhwNt1mGrzRUL30Ws32rtPxHmrTYnADwAFnAx+nVauYv2+xH6DNz/8F0Ku?=
 =?us-ascii?Q?2kTwOq9tH1XA7vBH2rY3CKXkBIsI8k+td+0otBJkvHSSPxTQEWGaFMUDPp1u?=
 =?us-ascii?Q?wdwocpePBJDad3akMUhuaIl9TyOncXQ2BuIaG3GNJLZhOkLmiIscaQijwQEO?=
 =?us-ascii?Q?TdzEN9W2jCon+3D9gdNm/3IgJODcdaNk5tujDm/AeVBWufaunlzC2Tlvh397?=
 =?us-ascii?Q?CHntCTCKwDr1ZsSsCfqBuepD9qpmNqBqYzb6xyes+ieoiFpaQ0h15FWph9R6?=
 =?us-ascii?Q?F2igzR42e21XkedLMNl/pHPa5vrBYsfCmKxAF7GJ/32km5V/WIXCycYW2OCJ?=
 =?us-ascii?Q?fVSmiBVnigimY5TukRrPl+nTl8hQ6njG4AS7tgbIBZ90tFjvvaGjQsKEO7ps?=
 =?us-ascii?Q?Zpe2CFaTYqa9A+qzCQaZqk5mBoLu2VH0plIjvyScXM38w/mH5czt8/m3ODAy?=
 =?us-ascii?Q?Zvz1SA+JE7b+1TSC5fwCWuCept50EN1k/3MHeM2IxWDa1BHDWjJ8Z/H4en19?=
 =?us-ascii?Q?C7vPmSyz7UVNysONqRswbMgyI/ppF0+LXLRvZkJPuMUmtvvESYHcOuxiOM1T?=
 =?us-ascii?Q?G7jBxeQYRvR/Z8Yck6KqEptRcp/UV22ZgREeeSLTxFFDJrGNycW7pUDTEfcb?=
 =?us-ascii?Q?x5WKxJrKf4GE3izlaaFv9fhjRfMfEMrwSOWI8vzkxKqd30pAuiKa4lAlaKYe?=
 =?us-ascii?Q?L60cT0t2a4Sh7TKjjRkLEfUOipi+lpAB6ylIo8GXM9pAOtCvY4oTe187apbo?=
 =?us-ascii?Q?Rg4Us5BVlIg78dDUz/UypPNUL6ZFLyc1XKeIOVrRmSm9pGVVZJfvMjG3pWyz?=
 =?us-ascii?Q?ysxC1zuGmkGJH4GxxjK1c9riQWokI1uJSBVn3l0ylGShyh+EdB5Av3TamPos?=
 =?us-ascii?Q?zg7zQxdr/mRUZvhoixp9M7ZI4ArCTPALp2988AXWD3lIi/isfFZRzBjRGFU/?=
 =?us-ascii?Q?NFNlRhN4jMb6mPHtYJItDd3mJZypSr7E0HF5SJ2snfdvpAxzLjPeLqsTl2Go?=
 =?us-ascii?Q?5h8ao7v4xIHDhPQD+zS9ZFxdhsRR3wH00qew1s7vJ7EtlrtBXFQC8x2M8d1/?=
 =?us-ascii?Q?uFHZWAstFC8TGjyoa5tTtz2ocbI9aVbUmr6XurAn9GketrFBE3TugZ4GkXhA?=
 =?us-ascii?Q?hl2Usp3dNrQazy57wAryh4OEpylSbpynYSy0a+YvZaTtFTEtZ5wnX74PEGqi?=
 =?us-ascii?Q?RrvRhF79QLAHZu+yhYzDaOmXHsn3jV4+sJESd556wK32zUi+9K6Haa914NEI?=
 =?us-ascii?Q?5dhfHTjKkQ=3D=3D?=
X-OriginatorOrg: citrix.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9044d93c-e194-4241-c2d4-08df33420957
X-MS-Exchange-CrossTenant-AuthSource: BY1PR03MB7996.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 09:18:02.9451
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 335836de-42ef-43a2-b145-348c2ee9ca5b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JljX1z0IRO42mMqgC8Lsn6mDtRL2OajudUPqwDOswWTFtirzXh48U4oYXDk8bLSWuo82pYa3r8qMlXpdvwHV9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR03MB6518
X-purgate-ID: tlsNG-ef75cf/1793006286-35AC0AE4-2CEEA0F0/0/0
X-purgate-type: clean
X-purgate-size: 14600
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Ross Lagerwall <ross.lagerwall@citrix.com>

Add new EFI load type for kexec. This load type is suitable for use when
Secure Boot is enabled.

When this load type is used, the caller should not pass purgatory as one
of the kexec segments. Instead, Xen will prepare any glue code needed
internally.

The new load type only works for Linux bzImages using the x86 64-bit
boot protocol documented at linux/Documentation/arch/x86/boot.rst.

Signed-off-by: Ross Lagerwall <ross.lagerwall@citrix.com>
Signed-off-by: Gerald Elder-Vass <gerald.elder-vass@cloud.com>
Signed-off-by: Kevin Lampis <kevin.lampis@citrix.com>
---
Changes in v3:
- Makefile: insert kexec.o alphabetically
- kimage_find_kernel_entry_maddr: use MB() macro
- public/kexec.h: Don't use anonymous union
  This required a new change to tools/libs/ctrl/xc_kexec.c

Changes in v2:
- Move kimage_find_kernel_entry_maddr to arch specific kexec.c file
  Didn't add stubs for other archs because CONFIG_HAS_KEXEC is x86 only
- When parsing kernel entry check for header magic and boot protocol version
- When parsing kernel entry use setup_sects instead of ROUNDUP
- Update commit message to explain new kexec type only works for x86 linux
- Rename kexec_image->boot_params to entry_arg
- Use size_t for return type of kernel_alignment_offset()
- Remove error handling around map_domain_page because it doesn't fail
---
 tools/libs/ctrl/xc_kexec.c         |  2 +-
 xen/arch/x86/Makefile              |  1 +
 xen/arch/x86/include/asm/bzimage.h |  5 ++
 xen/arch/x86/include/asm/kexec.h   |  9 ++++
 xen/arch/x86/kexec.c               | 58 +++++++++++++++++++++++
 xen/common/kexec.c                 | 11 ++++-
 xen/common/kimage.c                | 75 +++++++++++++++++++-----------
 xen/include/public/kexec.h         | 12 ++++-
 xen/include/xen/kimage.h           |  2 +
 9 files changed, 143 insertions(+), 32 deletions(-)
 create mode 100644 xen/arch/x86/include/asm/kexec.h
 create mode 100644 xen/arch/x86/kexec.c

diff --git a/tools/libs/ctrl/xc_kexec.c b/tools/libs/ctrl/xc_kexec.c
index a4e8966adc32..d54353b2ddc9 100644
--- a/tools/libs/ctrl/xc_kexec.c
+++ b/tools/libs/ctrl/xc_kexec.c
@@ -88,7 +88,7 @@ int xc_kexec_load(xc_interface *xch, uint8_t type, uint16_t arch,
 
     load->type = type;
     load->arch = arch;
-    load->entry_maddr = entry_maddr;
+    load->p.entry_maddr = entry_maddr;
     load->nr_segments = nr_segments;
     set_xen_guest_handle(load->segments.h, segments);
 
diff --git a/xen/arch/x86/Makefile b/xen/arch/x86/Makefile
index 2be90ea09880..cd08180c37e1 100644
--- a/xen/arch/x86/Makefile
+++ b/xen/arch/x86/Makefile
@@ -46,6 +46,7 @@ obj-$(CONFIG_PV) += ioport_emulate.o
 obj-y += io_apic.o
 obj-y += irq.o
 obj-$(CONFIG_LIVEPATCH) += livepatch.o
+obj-$(CONFIG_KEXEC) += kexec.o
 obj-$(CONFIG_KEXEC) += machine_kexec.o
 obj-y += mm.o x86_64/mm.o
 obj-$(CONFIG_VM_EVENT) += monitor.o
diff --git a/xen/arch/x86/include/asm/bzimage.h b/xen/arch/x86/include/asm/bzimage.h
index 8c54b21d0685..e363cc9a4f84 100644
--- a/xen/arch/x86/include/asm/bzimage.h
+++ b/xen/arch/x86/include/asm/bzimage.h
@@ -47,4 +47,9 @@ struct __packed bzimage_header {
         uint32_t        payload_length;
     };
 
+static inline size_t kernel_alignment_offset(void)
+{
+    return offsetof(struct bzimage_header, kernel_alignment);
+}
+
 #endif /* __X86_BZIMAGE_H__ */
diff --git a/xen/arch/x86/include/asm/kexec.h b/xen/arch/x86/include/asm/kexec.h
new file mode 100644
index 000000000000..04b7eee4c1a9
--- /dev/null
+++ b/xen/arch/x86/include/asm/kexec.h
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef ASM_X86_KEXEC_H
+#define ASM_X86_KEXEC_H
+
+struct kexec_image;
+int64_t kimage_find_kernel_entry_maddr(struct kexec_image *image);
+
+#endif /* ASM_X86_KEXEC_H */
diff --git a/xen/arch/x86/kexec.c b/xen/arch/x86/kexec.c
new file mode 100644
index 000000000000..52d2c50fb3b5
--- /dev/null
+++ b/xen/arch/x86/kexec.c
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#include <xen/kexec.h>
+#include <xen/kimage.h>
+#include <xen/guest_access.h>
+#include <asm/bzimage.h>
+
+/*
+ * Find the entry point to the new kernel, we need to map the crash region into
+ * memory in order to read the kernel header.
+ */
+#define KERNEL_SEGMENT_IDX 0
+int64_t kimage_find_kernel_entry_maddr(struct kexec_image *image)
+{
+    uint64_t dest_maddr;
+    uint32_t alignment, magic;
+    uint16_t version;
+    void *dest_va;
+    const struct bzimage_header *hdr;
+    int setup_sects;
+    size_t kern16_size;
+
+    dest_maddr = image->segments[KERNEL_SEGMENT_IDX].dest_maddr +
+                 image->segments[KERNEL_SEGMENT_IDX].dest_offset;
+
+    dest_va = map_domain_page(maddr_to_mfn(dest_maddr));
+
+    hdr = (const struct bzimage_header *)dest_va;
+    magic = hdr->header;
+    version = hdr->version;
+    alignment = hdr->kernel_alignment;
+    setup_sects = hdr->setup_sects == 0 ? 4 : hdr->setup_sects;
+    kern16_size = (setup_sects + 1 )  * 512;
+
+    unmap_domain_page(dest_va);
+
+    if ( magic != 0x53726448 || version < 0x0202 )
+        return -EINVAL;
+
+    /*
+     * Ensure the kernel alignment is a valid LOAD_PHYSICAL_ADDR,
+     * which ranges from 2MiB to 16MiB on 64-bit systems
+     * as defined in the kernel x86 Kconfig
+     */
+    if ( alignment % MB(2) != 0 ||
+         alignment < MB(2) ||
+         alignment > MB(16) )
+        return -EINVAL;
+
+    if ( (dest_maddr + kern16_size) % alignment )
+    {
+        printk(XENLOG_WARNING "kernel dest addr 0x%lx is not aligend to 0x%x\n",
+               dest_maddr + kern16_size, alignment);
+        return -EINVAL;
+    }
+
+    return dest_maddr + kern16_size + 0x200;
+}
diff --git a/xen/common/kexec.c b/xen/common/kexec.c
index c92c464fe0ec..2ad09cbdc1f3 100644
--- a/xen/common/kexec.c
+++ b/xen/common/kexec.c
@@ -757,6 +757,7 @@ static int kexec_load_get_bits(int type, int *base, int *bit)
         *bit = KEXEC_FLAG_DEFAULT_POS;
         break;
     case KEXEC_TYPE_CRASH:
+    case KEXEC_TYPE_CRASH_EFI:
         *base = KEXEC_IMAGE_CRASH_BASE;
         *bit = KEXEC_FLAG_CRASH_POS;
         break;
@@ -856,6 +857,7 @@ static int kexec_exec(XEN_GUEST_HANDLE_PARAM(void) uarg)
         break;
 
     case KEXEC_TYPE_CRASH:
+    case KEXEC_TYPE_CRASH_EFI:
         kexec_crash(CRASHREASON_KEXECCMD); /* Does not return */
         break;
     }
@@ -946,7 +948,7 @@ static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
         segments[i].dest_size = tmp_seg.dest_size;
     }
 
-    ret = kimage_alloc(&kimage, load.type, load.arch, load.entry_maddr,
+    ret = kimage_alloc(&kimage, load.type, load.arch, load.p.entry_maddr,
                        load.nr_segments, segments);
     if ( ret < 0 )
         goto error;
@@ -957,6 +959,13 @@ static int kexec_load(XEN_GUEST_HANDLE_PARAM(void) uarg)
 
     kimage_calc_digest(kimage, kimage->digest);
 
+    if ( load.type == KEXEC_TYPE_CRASH_EFI )
+    {
+        ret = kimage_efi_setup(kimage, load.p.parameters);
+        if ( ret < 0 )
+            goto error;
+    }
+
     ret = kexec_load_slot(kimage);
     if ( ret < 0 )
         goto error;
diff --git a/xen/common/kimage.c b/xen/common/kimage.c
index d4a695a2bdb9..b31f205176db 100644
--- a/xen/common/kimage.c
+++ b/xen/common/kimage.c
@@ -19,6 +19,7 @@
 #include <xen/mm.h>
 #include <xen/spinlock.h>
 
+#include <asm/kexec.h>
 #include <asm/page.h>
 
 /*
@@ -104,29 +105,6 @@ static int do_kimage_alloc(struct kexec_image **rimage, paddr_t entry,
     INIT_PAGE_LIST_HEAD(&image->dest_pages);
     INIT_PAGE_LIST_HEAD(&image->unusable_pages);
 
-    /*
-     * Verify we have good destination addresses.  The caller is
-     * responsible for making certain we don't attempt to load the new
-     * image into invalid or reserved areas of RAM.  This just
-     * verifies it is an address we can use.
-     *
-     * Since the kernel does everything in page size chunks ensure the
-     * destination addresses are page aligned.  Too many special cases
-     * crop of when we don't do this.  The most insidious is getting
-     * overlapping destination addresses simply because addresses are
-     * changed to page size granularity.
-     */
-    result = -EADDRNOTAVAIL;
-    for ( i = 0; i < nr_segments; i++ )
-    {
-        paddr_t mstart, mend;
-
-        mstart = image->segments[i].dest_maddr;
-        mend   = mstart + image->segments[i].dest_size;
-        if ( (mstart & ~PAGE_MASK) || (mend & ~PAGE_MASK) )
-            goto out;
-    }
-
     /*
      * Verify our destination addresses do not overlap.  If we allowed
      * overlapping destination addresses through very weird things can
@@ -212,9 +190,10 @@ static int kimage_normal_alloc(struct kexec_image **rimage, paddr_t entry,
                            KEXEC_TYPE_DEFAULT);
 }
 
-static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
-                              unsigned long nr_segments,
-                              struct kimage_segment *segments)
+static int do_kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
+                                 unsigned long nr_segments,
+                                 struct kimage_segment *segments,
+                                 uint8_t type)
 {
     unsigned long i;
 
@@ -248,8 +227,28 @@ static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
     }
 
     /* Allocate and initialize a controlling structure. */
-    return do_kimage_alloc(rimage, entry, nr_segments, segments,
-                           KEXEC_TYPE_CRASH);
+    return do_kimage_alloc(rimage, entry, nr_segments, segments, type);
+}
+
+static int kimage_crash_alloc(struct kexec_image **rimage, paddr_t entry,
+                              unsigned long nr_segments,
+                              struct kimage_segment *segments)
+{
+    /* Verify we have a valid entry point */
+    if ( (entry < kexec_crash_area.start)
+         || (entry > kexec_crash_area.start + kexec_crash_area.size))
+        return -EADDRNOTAVAIL;
+
+    return do_kimage_crash_alloc(rimage, entry, nr_segments, segments,
+                                 KEXEC_TYPE_CRASH);
+}
+
+static int kimage_crash_alloc_efi(struct kexec_image **rimage, paddr_t entry,
+                                  unsigned long nr_segments,
+                                  struct kimage_segment *segments)
+{
+    return do_kimage_crash_alloc(rimage, entry, nr_segments, segments,
+                                 KEXEC_TYPE_CRASH_EFI);
 }
 
 static int kimage_is_destination_range(struct kexec_image *image,
@@ -421,6 +420,7 @@ struct page_info *kimage_alloc_control_page(struct kexec_image *image,
         pages = kimage_alloc_normal_control_page(image, memflags);
         break;
     case KEXEC_TYPE_CRASH:
+    case KEXEC_TYPE_CRASH_EFI:
         pages = kimage_alloc_crash_control_page(image);
         break;
     }
@@ -781,6 +781,7 @@ static int kimage_load_segment(struct kexec_image *image,
             result = kimage_load_normal_segment(image, segment);
             break;
         case KEXEC_TYPE_CRASH:
+        case KEXEC_TYPE_CRASH_EFI:
             result = kimage_load_crash_segment(image, segment);
             break;
         }
@@ -831,6 +832,10 @@ int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
     case KEXEC_TYPE_CRASH:
         result = kimage_crash_alloc(rimage, entry_maddr, nr_segments, segment);
         break;
+    case KEXEC_TYPE_CRASH_EFI:
+        result = kimage_crash_alloc_efi(rimage, entry_maddr,
+                                        nr_segments, segment);
+        break;
     default:
         result = -EINVAL;
         break;
@@ -1039,6 +1044,20 @@ done:
     return ret;
 }
 
+int kimage_efi_setup(struct kexec_image *image, uint64_t parameters)
+{
+    int64_t rip;
+
+    rip = kimage_find_kernel_entry_maddr(image);
+    if ( rip < 0 )
+        return -EINVAL;
+
+    image->entry_arg = parameters;
+    image->entry_maddr = rip;
+
+    return 0;
+}
+
 /*
  * Local variables:
  * mode: C
diff --git a/xen/include/public/kexec.h b/xen/include/public/kexec.h
index abb2a49238f1..25eef43dab53 100644
--- a/xen/include/public/kexec.h
+++ b/xen/include/public/kexec.h
@@ -54,13 +54,16 @@
  * - kexec into a regular kernel, very similar to a standard reboot
  *   - KEXEC_TYPE_DEFAULT is used to specify this type
  * - kexec into a special "crash kernel", aka kexec-on-panic
- *   - KEXEC_TYPE_CRASH is used to specify this type
+ *   - KEXEC_TYPE_CRASH or KEXEC_TYPE_CRASH_EFI are used to specify this type
+ *   - in case of KEXEC_TYPE_CRASH_EFI the first segment will point to the
+ *     full kernel to load and entry point will point to boot params
  *   - parts of our system may be broken at kexec-on-panic time
  *     - the code should be kept as simple and self-contained as possible
  */
 
 #define KEXEC_TYPE_DEFAULT 0
 #define KEXEC_TYPE_CRASH   1
+#define KEXEC_TYPE_CRASH_EFI 3
 
 /*
  * Perform kexec having previously loaded a kexec or kdump kernel
@@ -167,7 +170,12 @@ typedef struct xen_kexec_load {
         XEN_GUEST_HANDLE(xen_kexec_segment_t) h;
         uint64_t _pad;
     } segments;
-    uint64_t entry_maddr; /* image entry point machine address. */
+
+    /* Image entry point machine address or parameters in case of EFI. */
+    union {
+        uint64_t entry_maddr;
+        uint64_t parameters;
+    } p;
 } xen_kexec_load_t;
 DEFINE_XEN_GUEST_HANDLE(xen_kexec_load_t);
 
diff --git a/xen/include/xen/kimage.h b/xen/include/xen/kimage.h
index 86250f29394e..fdda0a89a53a 100644
--- a/xen/include/xen/kimage.h
+++ b/xen/include/xen/kimage.h
@@ -48,6 +48,7 @@ struct kexec_image {
     paddr_t next_crash_page;
 
     uint8_t digest[SHA2_256_DIGEST_SIZE];
+    uint64_t entry_arg;
 };
 
 int kimage_alloc(struct kexec_image **rimage, uint8_t type, uint16_t arch,
@@ -66,6 +67,7 @@ int kimage_build_ind(struct kexec_image *image, mfn_t ind_mfn,
 bool kimage_verify_digest(const struct kexec_image *image);
 void kimage_calc_digest(const struct kexec_image *image,
                         uint8_t digest[SHA2_256_DIGEST_SIZE]);
+int kimage_efi_setup(struct kexec_image *image, uint64_t parameters);
 
 #endif /* __ASSEMBLER__ */
 
-- 
2.52.0


