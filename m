From: Thomas Garnier <thgarnie@chromium.org>
Subject: Re: [PATCH v6 00/27] x86: PIE support and option to
 extend KASLR randomization
Date: Thu, 31 Jan 2019 14:42:21 -0800
Message-ID: <CAJcbSZE890YgtEv_Z9A3kPukQzmZmgo0xM=pruMB3uTziBFwMw__10178.4254585922$1548976523$gmane$org@mail.gmail.com>
References: <20190131192533.34130-1-thgarnie@chromium.org>
 <20190131214038.GI28234@char.us.oracle.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=6Maf=QH=chromium.org=thgarnie@srs-us1.protection.inumbo.net>)
 id 1gpLXF-0002Kb-1D
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 23:14:17 +0000
Received: by mail-io1-xd44.google.com with SMTP id m19so4234490ioh.3
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jan 2019 15:14:16 -0800 (PST)
Received: from mail-it1-f171.google.com (mail-it1-f171.google.com.
 [209.85.166.171])
 by smtp.gmail.com with ESMTPSA id t7sm2543049iom.27.2019.01.31.15.14.15
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Jan 2019 15:14:15 -0800 (PST)
Received: by mail-it1-f171.google.com with SMTP id w18so6513430ite.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jan 2019 15:14:15 -0800 (PST)
In-Reply-To: <20190131214038.GI28234@char.us.oracle.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Cc: Kernel Hardening <kernel-hardening@lists.openwall.com>, Jan Kiszka <jan.kiszka@siemens.com>, Pavel Machek <pavel@ucw.cz>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Christoph Lameter <cl@linux.com>, =?UTF-8?Q?Rafael_=C3=81vila_de_Esp=C3=ADndola?= <rafael@espindo.la>, linux-arch <linux-arch@vger.kernel.org>, Andi Kleen <ak@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Sparse Mailing-list <linux-sparse@vger.kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, Alexander Popov <alex.popov@linux.com>, Len Brown <len.brown@intel.com>, Linux PM list <linux-pm@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Andy Lutomirski <luto@kernel.org>, Dennis Zhou <dennis@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, nixiaoming <nixiaoming@huawei.com>, Michal Marek <michal.lkml@markovi.n>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgMTo0MSBQTSBLb25yYWQgUnplc3p1dGVrIFdpbGsKPGtv
bnJhZC53aWxrQG9yYWNsZS5jb20+IHdyb3RlOgo+Cj4gT24gVGh1LCBKYW4gMzEsIDIwMTkgYXQg
MTE6MjQ6MDdBTSAtMDgwMCwgVGhvbWFzIEdhcm5pZXIgd3JvdGU6Cj4gPiBUaGVyZSBoYXMgYmVl
biBubyBtYWpvciBjb25jZXJuIGluIHRoZSBsYXRlc3QgaXRlcmF0aW9ucy4gSSBhbSBpbnRlcmVz
dGVkIG9uCj4gPiB3aGF0IHdvdWxkIGJlIHRoZSBiZXN0IHdheSB0byBzbG93bHkgaW50ZWdyYXRl
IHRoaXMgcGF0Y2hzZXQgdXBzdHJlYW0uCj4KPiBPbmUgcXVlc3Rpb24gdGhhdCBJIHdhcyBzb21l
aG93IGV4cGVjdGVkIGluIHRoaXMgY292ZXIgbGV0dGVyIC0gd2hhdAo+IGFib3V0IGFsbCB0aG9z
ZSBsb3ZlbHkgc3BlY3VsYXRpdmUgYnVncz8gQXMgaW4gc2F5IHNvbWUgb25lIGhhc24ndAo+IHVw
ZGF0ZWQgdGhlaXIgbWFjaGluZSB3aXRoIHRoZSBTcGVjdHJlIHYzYSBtaWNyb2NvZGUgLSB3b3Vs
ZG4ndCB0aGV5Cj4gYmUgYWJsZSB0byBnZXQgdGhlIGtlcm5lbCB2aXJ0dWFsIGFkZHJlc3Mgc3Bh
Y2U/CgpZZXMgdGhleSB3b3VsZCBiZS4KCj4KPiBJbiBlZmZlY3QgcmVuZGVyaW5nIGFsbCB0aGlz
IGhhcmQtd29yayBub3QgbmVlZGVkPwoKT25seSBpZiB3ZSB0aGluayBTcGVjdHJlIGJ1Z3Mgd2ls
bCBuZXZlciBiZSBmaXhlZC4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
