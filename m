Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 703F1606A684
	for <xen-devel@archiver.kernel.org>; Tue, 24 Nov 2026 16:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vates.tech header.i=@vates.tech header.a=rsa-sha256 header.s=selector1 header.b=k3uNy8xx
Received: from list by lists.xenproject.org with outflank-mailman.1501251.1697302 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtiC-0005qy-DY; Tue, 24 Nov 2026 16:49:44 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1501251.1697302; Tue, 24 Nov 2026 16:49:44 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1xVtiC-0005qr-Ag; Tue, 24 Nov 2026 16:49:44 +0000
Received: by outflank-mailman (input) for mailman id 1501251;
 Tue, 24 Nov 2026 16:49:42 +0000
Received: from mx.expurgate.net ([195.190.135.10])
 by lists.xenproject.org with esmtp (Exim 4.92) id 1xVtiA-0005ql-77
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 16:49:42 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1xVti9-008Y4l-5n
 for xen-devel@lists.xenproject.org; Tue, 24 Nov 2026 17:49:41 +0100
Received: from [10.42.69.12] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1) (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e767cd30001cf5@swg.vates.tech>)
 id 6b05c023-8faa-0a2a0a5109dd-0a2a450cb52a-4
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:49:41 +0100
Received: from [185.255.28.35] (helo=prod-mta-13-02.swg-srv.net)
 by tlsNG-d25034.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from
 <prod-mta-13.8631fc262581453bbf619ec5b2062170.1a20e767cd30001cf5@swg.vates.tech>)
 id 6b05c024-f479-0a2a450c0019-b9ff1c238cc3-3
 for <xen-devel@lists.xenproject.org>; Tue, 24 Nov 2026 17:49:40 +0100
Received: from mail2.vates.fr ([37.26.189.201] mail2.vates.fr)
 (Authenticated sender:
 8631fc262581453bbf619ec5b2062170/smtp/7773de5a-2839-4720-82ee-e06722ae1d3e)
 by prod-mta-13-02.swg-srv.net (ZoneMTA - prod-mta-13) with ESMTPSA id
 1a20e767cd30001cf5.006 for <xen-devel@lists.xenproject.org>
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
 Tue, 24 Nov 2026 16:49:35 +0000
Received: from localhost.localdomain (88-188-240-210.subs.proxad.net
 [88.188.240.210]) (Authenticated sender: teddy.astie)
 by mail2.vates.fr (Postfix) with ESMTPSA id 07D298222C;
 Tue, 24 Nov 2026 17:49:35 +0100 (CET)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=selector1 header.d=vates.tech header.i="@vates.tech" header.h="From:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:Feedback-ID"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vates.tech;
 q=dns/txt; s=selector1; bh=w9V4lIwEKdjwWNM3oiGlmu0w9MLrMmoMQkA7+tfDFS0=;
 h=from:subject:date:message-id:to:cc:mime-version:content-type:feedback-id;
 b=k3uNy8xxZjFPnNBcfnOIZLhzt73OTjsFqNkbjOnYEXLiTFkAn3UBZTGj/C9YfLgFy1+0SBY6K
 rROZ8j3aF0C4aFlZy/VAf6ejkzNYiwA2W3W7hRv8qvYlR6l0c2k2oF7CjwJ9VqnyKmA4m5nJR7l
 fIT+A+LNT0HDFWrAUWlDDdDoPETvqnYMZkAQuJIsqhKhLhVTK790cS5oLM0v+vPp8CMhZLEFCPx
 y3/bcwI7Uh0PbVHbLpmi3dHeDQZ5NlzfcX69PJAGUrlb3HUQCrrLG96zJWfjJ63DRaee8lXwuI1
 MZfdcStwBYOyZXLi+BQc/T/5ZKzRRl/ycRAg+WgDMAUg==
X-Zone-Loop: dfe34cd8b056a37daec6ad21b61a46db8555ebb296f1
x-campaign-type: default
x-transaction-id: ca1610ea-b4cc-448c-b5c1-8d81f32d7941
x-swg-uid: 01-81dffd21-3f20-4fa6-bf58-755186aab30d
X-Mailer: Sweego
Message-ID:
 <1795538976.8631fc262581453bbf619ec5b2062170.1a20e767cd30001cf5@vates.tech>
x-swg-bid: 1795538976.8631fc262581453bbf619ec5b2062170.1a20e767cd30001cf5
Feedback-ID: default:8631fc262581453bbf619ec5b2062170:Sweego
x-campaign-id: default
x-client-id: 8631fc262581453bbf619ec5b2062170
From: Teddy Astie <teddy.astie@vates.tech>
To: xen-devel@lists.xenproject.org
Cc: Teddy Astie <teddy.astie@vates.tech>,
	Jan Beulich <jbeulich@suse.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	=?UTF-8?q?Roger=20Pau=20Monn=C3=A9?= <roger@xenproject.org>,
	Anthony PERARD <anthony.perard@vates.tech>,
	Michal Orzel <michal.orzel@amd.com>,
	Julien Grall <julien@xen.org>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Dario Faggioli <dfaggioli@suse.com>,
	Juergen Gross <jgross@suse.com>,
	George Dunlap <gwd@xenproject.org>,
	"Daniel P. Smith" <dpsmith@apertussolutions.com>,
	Baptiste Le Duc <baptiste.le-duc@vates.tech>,
	Oleksii Kurochko <oleksii.kurochko@gmail.com>
Subject: [RFC PATCH v2 00/13] hvm: New Xen HVM ABI proposal ("HVMv2", "FastABI")
Date: Tue, 24 Nov 2026 17:48:29 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BM-Disclaimer: Yes
Content-Type: multipart/alternative; boundary="-=Part.12c.730f63ddf320cd93.1a20e767a6e.499567c837d851ef=-"
X-Bm-Milter-Handled: 4ffbd6c1-ee69-4e1b-aabd-f977039bd3e2
X-Bm-Transport-Timestamp: 1795538975348
X-purgate-ID: tlsNG-d25034/1795538980-52331A5B-D929A1F9/10/73395122804
X-purgate-type: spam
X-purgate-size: 6886
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,SPF_PASS,
	UNPARSEABLE_RELAY autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

---=Part.12c.730f63ddf320cd93.1a20e767a6e.499567c837d851ef=-
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello,

This is a long-running proposal of a new hypervisor ABI for HVM guests,
aimed at improving on some of the short-commings of the existing one=2E

More precisely, here are some of the issues of the current hypervisor
ABI (virtual addresses to C struct) :=20

* With confidential computing (SEV/TDX/=2E=2E=2E), it is not possible to
  access guest virtual memory; hence we need to do hypercalls
  differently=2E

* A lot of complex operations are unconditionally exposed to the guest
  and can't easily be turned off, that makes mitigating security issues
  more difficult=2E

* Many features have no reliable enumeration for the guest to use=2E

* Copying from/to guest virtual address is expensive; see numbers below=2E

* It's not always easy to use from other languages than C and is
  subject to ABI compatibility issues [1]; and ultimately the reason
  CONFIG_COMPAT exists=2E

  It also happens to be a problem for Windows PV Drivers as Windows
  doesn't use SysV ABI=2E

* OVMF can't implement UEFI time services due to quirks around
  shared_info page (which contains wallclock) that can be moved by
  the operating system [2]=2E

(and probably many others)

The idea is to rethink the ABI from the ground with some key ideas :=20

* Start with a small core ABI (i=2Ee just what modern guests needs)
  then expand it appropriately, ideally as optional expansions that
  can be turned off when not needed=2E

* Try to avoid tricky cases with guest physmap manipulation=2E If would
  be better if it can be made optional for the guest=2E

* Design it with HVM with HAP in mind i=2Ee avoid expensive pagewalks=2E

* Eventually at some point, have a way to make specific guest only
  support this new ABI=2E

Some limitations with current implementation :=20

* Guests needs to be patched, only PVH is considered for now=2E

* A alternative approach needs to be implemented for shared_info/gnttab
  placement and enumeration (given that physmap manipulation is not
  longer available)=2E
  (I have a somewhat experimental proposal by using E820, but I'm
   open for alternatives)

* There is no toolstack/dom0 support in this ABI, to me, it
  should be considered separately (especially for SecureBoot)=2E

* Only long mode is supported (as FastABI uses x86_64-only registers)

Open topics :=20

* Should we use another name ?

* Hypercalls outside of long mode ?

* Proper way of exposing the Xen special pages to the guests ?
  (or at least, exposing the location)

* ARM/RISC-V considerations

* Ways to implement other hypercalls (yet another ABI ?)

Teddy

v1: https://lore=2Ekernel=2Eorg/xen-devel/cover=2E1755785258=2Egit=2Eteddy=
=2Eastie@vates=2Etech/

[1] https://faultlore=2Ecom/blah/c-isnt-a-language/

[2] https://github=2Ecom/tianocore/edk2/blob/9ae00fddec5f651f2e93088370356=
235022366d8/OvmfPkg/Library/XenRealTimeClockLib/XenRealTimeClockLib=2Ec#L97=
-L101

Cc: Baptiste Le Duc <baptiste=2Ele-duc@vates=2Etech>
Cc: Oleksii Kurochko <oleksii=2Ekurochko@gmail=2Ecom>

Teddy Astie (13):
  x86/hvm: Use direct structures instead of guest handles
  common: Isolate XENVER_get_features into a separate function
  hvm: Introduce FastABI infrastructure
  fastabi: Introduce xen_version op
  fastabi: Introduce sched_op
  fastabi: Introduce event_channel_op
  fastabi: Introduce vcpu_op
  fastabi: Introduce hvm_op
  wip: fastabi: Introduce memory_op
  x86/fastabi: Expose to guest by default
  wip: fastabi: Introduce "strict" mode for FastABI
  wip: fastabi: Add evtchn_status helpers in struct
  wip: light: Introduce fixed memory layout

 =2E=2E=2E/guest-guide/fastabi/abi/event_channel=2Eyml | 130 +++++++++++
 docs/guest-guide/fastabi/abi/hvm=2Eyml          |  50 +++++
 docs/guest-guide/fastabi/abi/memory=2Eyml       |  16 ++
 docs/guest-guide/fastabi/abi/sched=2Eyml        |  48 +++++
 docs/guest-guide/fastabi/abi/vcpu=2Eyml         | 139 ++++++++++++
 docs/guest-guide/fastabi/abi/version=2Eyml      |  15 ++
 docs/guest-guide/fastabi/index=2Erst            |  26 +++
 docs/guest-guide/x86/fastabi=2Erst              |  58 +++++
 docs/guest-guide/x86/index=2Erst                |   1 +
 tools/include/xen-tools/common-macros=2Eh       |   4 +
 tools/libs/guest/xg_dom_x86=2Ec                 |  84 ++++++++
 tools/libs/light/libxl_create=2Ec               |   3 +-
 tools/libs/light/libxl_types=2Eidl              |   1 +
 tools/libs/light/libxl_x86=2Ec                  |  75 +++++++
 tools/xl/xl_parse=2Ec                           |   2 +
 xen/arch/x86/cpuid=2Ec                          |   3 +
 xen/arch/x86/domain=2Ec                         |  67 ++++++
 xen/arch/x86/hvm/hvm=2Ec                        | 202 +++++++++++++-----
 xen/arch/x86/hvm/hypercall=2Ec                  |  20 ++
 xen/arch/x86/include/asm/fastabi=2Eh            |  18 ++
 xen/common/Kconfig                            |   7 +
 xen/common/Makefile                           |   1 +
 xen/common/domain=2Ec                           | 171 +++++++++++++++
 xen/common/event_channel=2Ec                    | 198 +++++++++++++++++
 xen/common/fastabi=2Ec                          |  42 ++++
 xen/common/kernel=2Ec                           | 118 ++++++----
 xen/common/memory=2Ec                           |  40 ++++
 xen/common/sched/core=2Ec                       | 145 +++++++++++--
 xen/include/public/arch-x86/cpuid=2Eh           |   8 +
 xen/include/public/arch-x86/hvm/start_info=2Eh  |   9 +
 xen/include/public/event_channel=2Eh            |   5 +
 xen/include/public/fastabi=2Eh                  |  11 +
 xen/include/public/memory=2Eh                   |  12 ++
 xen/include/xen/fastabi=2Eh                     |  20 ++
 34 files changed, 1633 insertions(+), 116 deletions(-)
 create mode 100644 docs/guest-guide/fastabi/abi/event_channel=2Eyml
 create mode 100644 docs/guest-guide/fastabi/abi/hvm=2Eyml
 create mode 100644 docs/guest-guide/fastabi/abi/memory=2Eyml
 create mode 100644 docs/guest-guide/fastabi/abi/sched=2Eyml
 create mode 100644 docs/guest-guide/fastabi/abi/vcpu=2Eyml
 create mode 100644 docs/guest-guide/fastabi/abi/version=2Eyml
 create mode 100644 docs/guest-guide/fastabi/index=2Erst
 create mode 100644 docs/guest-guide/x86/fastabi=2Erst
 create mode 100644 xen/arch/x86/include/asm/fastabi=2Eh
 create mode 100644 xen/common/fastabi=2Ec
 create mode 100644 xen/include/public/fastabi=2Eh
 create mode 100644 xen/include/xen/fastabi=2Eh

--=20
2=2E56=2E1



-- 
Teddy Astie | Vates XCP-ng Developer

XCP-ng & Xen Orchestra - Vates s=
olutions

web: https://vates=2Etech
---=Part.12c.730f63ddf320cd93.1a20e767a6e.499567c837d851ef=---

