From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 0/2] Dangling fixes for ARM iommu
Date: Wed, 23 Jan 2019 19:53:09 +0200
Message-ID: <73eedabd-8552-8d20-f0eb-609fe0f35fbd@gmail.com>
References: <1548090247-20078-1-git-send-email-andrii.anisov@gmail.com>
 <c760919c-e635-ee39-6c74-fcac97dc060d@arm.com>
 <77aca14e-dd88-855c-4d7f-2e3a600a5e7a@gmail.com>
 <3a213999-d67a-9cff-d3bf-3d4cf5baa5b3@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=5y24=P7=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1gmMi9-0003aC-OK
 for xen-devel@lists.xenproject.org; Wed, 23 Jan 2019 17:53:13 +0000
Received: by mail-lf1-x144.google.com with SMTP id a8so2248837lfk.5
 for <xen-devel@lists.xenproject.org>; Wed, 23 Jan 2019 09:53:12 -0800 (PST)
In-Reply-To: <3a213999-d67a-9cff-d3bf-3d4cf5baa5b3@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, xen-devel@lists.xenproject.org
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Andrii Anisov <andrii_anisov@epam.com>
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMjIuMDEuMTkgMTY6MzEsIEp1bGllbiBHcmFsbCB3cm90ZToKPj4g
SU1PLCB0aGUgcHVyZSBmaXhlcywgbGlrZSBwYXRjaCAyLCBhbmQgdGhlIGZpcnN0IGh1bmsgb2Yg
cGF0Y2ggMSBzaG91bGQgYmUgT0sgZm9yIDQuMTIuCj4gCj4gVGhlIGZpcnN0IGh1bmsgb2YgcGF0
Y2ggMSBhc2lkZSwgd2UgbmV2ZXIgc3VwcG9ydGVkIHRoZSBuZXcgSU9NTVUgYmluZGluZ3Mgbm9y
IHVuc2hhcmluZyB0aGUgUDJNLiBTbyB3aGF0IGRvIHlvdSBhY3R1YWxseSBmaXg/Cj4gCj4gU3Vw
cG9ydGluZyB1bnNoYXJlZCBQMk0gd2lsbCByZXF1aXJlIG1vcmUgd29yayBnaXZlbiBiZWNhdXNl
IHRoZSBjb2RlIHJlbGllcyBvbiBtZm5fdG9fZ21mbiB0aGF0IGlzIG5vdCBpbXBsZW1lbnRlZCBv
biBBcm0uIFNvIGFjY2VwdGluZyB0aGlzIHBhdGNoIHN0YW5kYWxvbmUgd291bGQgYmUgbWlzbGVh
ZGluZyBhcyB0aGUgcmVzdCBvZiB0aGUgc2VyaWVzIGlzIG5vdCBnb2luZyB0byBiZSBtZXJnZWQg
aW4gWGVuIDQuMTIuCkknbSBub3Qgc2F5aW5nIEkgd2FudCBzb21ldGhpbmcgZnJvbSBub24tc2hh
cmVkIHAybSBwdXNoIGludG8gNC4xMi4KSSB3b3VsZCBzdHJpcCB0aGUgZmlyc3QgcGF0Y2ggdG8g
aXRzIGZpcnN0IGNodW5rLgoKPiBTaW1pbGFybHksIHdlIGRvbid0IHN1cHBvcnQgbmV3IElPTU1V
IGJpbmRpbmdzLiBUaGUgcGF0Y2ggIzIgYWxvbmUgaXMgZ29pbmcgdG8gYWRkIG1vcmUgdHJvdWJs
ZSBhcyBub3cgRG9tMCB3b3VsZCBub3QgYmUgYWJsZSB0byB1c2UgdGhlIElPTU1VIGlmIGl0IHdl
cmUgbm90IGhpZGRlbi4KQXJlIHlvdSBzdXJlIHdlIHNob3VsZCBwYXNzIElPTU1VIGRldmljZXMg
b3IgcmVsYXRlZCBpbmZvIHRvIERvbTAgaWYgdGhleSBhcmUgbm90IHN1cHBvcnRlZCBieSBoeXBl
cnZpc29yPwpUaGUgY29tbWl0IG1lc3NhZ2Ugc3RhdGVzICJXZSBkb24ndCBwYXNzdGhyb3VnaCBJ
T01NVSBkZXZpY2UgdG8gRE9NMCBldmVuIGlmIGl0IGlzIG5vdCB1c2VkIGJ5IFhlbi4iLCBhbmQg
eW91IGFncmVlZCB0aGF0IHNvbWUgdGltZSBhZ28uIENvdWxkIHlvdSBwbGVhc2UgY2xhcmlmeSB3
aHkgeW91IGhhdmUgY2hhbmdlZCB5b3VyIG1pbmQ/CgotLSAKU2luY2VyZWx5LApBbmRyaWkgQW5p
c292LgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVu
LWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6
Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
