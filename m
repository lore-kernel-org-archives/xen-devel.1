From: Kees Cook <keescook@chromium.org>
Subject: Re: [PATCH v6 00/27] x86: PIE support and option to
 extend KASLR randomization
Date: Fri, 1 Feb 2019 08:59:21 +1300
Message-ID: <CAGXu5jLGFd2UY89bPm_WQvcsX+RDMg0XoJvuXwfknJrGxpn4Ng__42006.6221196734$1548965318$gmane$org@mail.gmail.com>
References: <20190131192533.34130-1-thgarnie@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=YTs+=QH=chromium.org=keescook@srs-us1.protection.inumbo.net>)
 id 1gpIcd-0007Cu-J9
 for xen-devel@lists.xenproject.org; Thu, 31 Jan 2019 20:07:39 +0000
Received: by mail-ua1-x942.google.com with SMTP id c24so1498896uak.1
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jan 2019 12:07:38 -0800 (PST)
Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com.
 [209.85.221.173])
 by smtp.gmail.com with ESMTPSA id h84sm818545vsi.28.2019.01.31.12.07.37
 for <xen-devel@lists.xenproject.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 31 Jan 2019 12:07:37 -0800 (PST)
Received: by mail-vk1-f173.google.com with SMTP id t127so1034787vke.8
 for <xen-devel@lists.xenproject.org>; Thu, 31 Jan 2019 12:07:37 -0800 (PST)
In-Reply-To: <20190131192533.34130-1-thgarnie@chromium.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Garnier <thgarnie@chromium.org>
Cc: Kernel Hardening <kernel-hardening@lists.openwall.com>, Jan Kiszka <jan.kiszka@siemens.com>, Pavel Machek <pavel@ucw.cz>, Andrey Ryabinin <aryabinin@virtuozzo.com>, Christoph Lameter <cl@linux.com>, =?UTF-8?Q?Rafael_=C3=81vila_de_Esp=C3=ADndola?= <rafael@espindo.la>, linux-arch <linux-arch@vger.kernel.org>, Andi Kleen <ak@linux.intel.com>, Michael Ellerman <mpe@ellerman.id.au>, Sparse Mailing-list <linux-sparse@vger.kernel.org>, xen-devel <xen-devel@lists.xenproject.org>, Alexander Popov <alex.popov@linux.com>, Len Brown <len.brown@intel.com>, Linux PM list <linux-pm@vger.kernel.org>, Nicholas Piggin <npiggin@gmail.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Mike Rapoport <rppt@linux.vnet.ibm.com>, Andy Lutomirski <luto@kernel.org>, Dennis Zhou <dennis@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, nixiaoming <nixiaoming@huawei.com>, Michal Marek <michal.lkml@markovi.n>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBGZWIgMSwgMjAxOSBhdCA4OjI4IEFNIFRob21hcyBHYXJuaWVyIDx0aGdhcm5pZUBj
aHJvbWl1bS5vcmc+IHdyb3RlOgo+IFRoZXNlIHBhdGNoZXMgbWFrZSB0aGUgY2hhbmdlcyBuZWNl
c3NhcnkgdG8gYnVpbGQgdGhlIGtlcm5lbCBhcyBQb3NpdGlvbgo+IEluZGVwZW5kZW50IEV4ZWN1
dGFibGUgKFBJRSkgb24geDg2XzY0LiBBIFBJRSBrZXJuZWwgY2FuIGJlIHJlbG9jYXRlZCBiZWxv
dwo+IHRoZSB0b3AgMkcgb2YgdGhlIHZpcnR1YWwgYWRkcmVzcyBzcGFjZS4gSXQgYWxsb3dzIHRv
IG9wdGlvbmFsbHkgZXh0ZW5kIHRoZQo+IEtBU0xSIHJhbmRvbWl6YXRpb24gcmFuZ2UgZnJvbSAx
RyB0byAzRy4gVGhlIGNob3NlbiByYW5nZSBpcyB0aGUgb25lIGN1cnJlbnRseQo+IGF2YWlsYWJs
ZSwgZnV0dXJlIGNoYW5nZXMgd2lsbCBhbGxvdyB0aGUga2VybmVsIG1vZHVsZSB0byBoYXZlIGEg
d2lkZXIKPiByYW5kb21pemF0aW9uIHJhbmdlLgoKVGhpcyBhbHNvIGxheXMgdGhlIGdyb3VuZHdv
cmsgZm9yIGRvaW5nIGNvbXBpbGF0aW9uLXVuaXQtZ3JhbnVsYXJpdHkKS0FTTFIsIGFzIEtyaXN0
ZW4gaGFzIGJlZW4gd29ya2luZyBvbi4gV2l0aCBQSUUgd29ya2luZywgdGhlCnJlbG9jYXRpb25z
IGFyZSBtb3JlIHNhbmUgYW5kIGJvb3QtdGltZSByZW9yZGVyaW5nIGJlY29tZXMgcG9zc2libGUK
KG9yIGF0IGxlYXN0LCBpdCBiZWNvbWVzIHRoZSBzYW1lIGxvZ2ljYWxseSBhcyBkb2luZyB0aGUg
d29yayBvbgptb2R1bGVzLCBldGMpLgoKLS0gCktlZXMgQ29vawoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
