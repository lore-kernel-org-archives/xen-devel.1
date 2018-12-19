From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [PATCH 00/41] scsi: Mark expected switch
 fall-throughs
Date: Tue, 18 Dec 2018 21:53:35 -0600
Message-ID: <ab57e784-9471-a707-0fe6-b12b0cb027f3__1100.38848729364$1545191566$gmane$org@embeddedor.com>
References: <cover.1543374820.git.gustavo@embeddedor.com>
 <304623b0-e0ad-ec9c-7097-c6f00ba43948@embeddedor.com>
 <yq1mup2i3h1.fsf@oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6KQm=O4=embeddedor.com=gustavo@srs-us1.protection.inumbo.net>)
 id 1gZSvd-0004M4-B7
 for xen-devel@lists.xenproject.org; Wed, 19 Dec 2018 03:53:49 +0000
Received: from cm10.websitewelcome.com (cm10.websitewelcome.com [100.42.49.4])
 by gateway22.websitewelcome.com (Postfix) with ESMTP id 94C464007
 for <xen-devel@lists.xenproject.org>; Tue, 18 Dec 2018 21:53:47 -0600 (CST)
In-Reply-To: <yq1mup2i3h1.fsf@oracle.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: Don Brace <don.brace@microsemi.com>, =?UTF-8?Q?Kai_M=c3=a4kisara?= <Kai.Makisara@kolumbus.fi>, Artur Paszkiewicz <artur.paszkiewicz@intel.com>, Matthew Wilcox <willy@infradead.org>, Vinayak Holikatti <vinholikatti@gmail.com>, Ketan Mukadam <ketan.mukadam@broadcom.com>, Kees Cook <keescook@chromium.org>, Hannes Reinecke <hare@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Bradley Grove <linuxdrivers@attotech.com>, Sudarsana Kalluru <sudarsana.kalluru@qlogic.com>, Subbu Seetharaman <subbu.seetharaman@broadcom.com>, Sathya Prakash <sathya.prakash@broadcom.com>, esc.storagedev@microsemi.com, James Smart <james.smart@broadcom.com>, Finn Thain <fthain@telegraphics.com.au>, Kashyap Desai <kashyap.desai@broadcom.com>, xen-devel@lists.xenproject.org, osst-users@lists.sourceforge.net, MPT-FusionLinux.pdl@broadcom.com, Boaz Harrosh <ooo@electrozaur.com>, Dick Kennedy <di>
List-Id: xen-devel@lists.xenproject.org

CgpPbiAxMi8xOC8xOCA5OjQ1IFBNLCBNYXJ0aW4gSy4gUGV0ZXJzZW4gd3JvdGU6Cj4gCj4gSWYg
eW91IGhhdmVuJ3QgcmVjZWl2ZWQgZmVlZGJhY2sgb24gYSBwYXRjaCB5b3Ugc2hvdWxkIHBva2Ug
dGhlIHJlbGV2YW50Cj4gZHJpdmVyIG1haW50YWluZXIuCj4gCgpHb3QgaXQuIFdpbGwgZG8gc28u
CgpUaGFua3MKLS0KR3VzdGF2bwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJv
amVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hl
bi1kZXZlbA==
