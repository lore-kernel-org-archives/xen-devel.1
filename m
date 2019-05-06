From: Andrii Anisov <andrii.anisov@gmail.com>
Subject: Re: [PATCH 16/20] xen/arm: mm: Protect Xen page-table
 update with a spinlock
Date: Mon, 6 May 2019 11:20:06 +0300
Message-ID: <a4fa267f-c4c0-ac09-4694-42f675965cea@gmail.com>
References: <20190422164937.21350-1-julien.grall@arm.com>
 <20190422164937.21350-17-julien.grall@arm.com>
 <13fdc8c8-5dba-7b21-067e-e54e9531bf73@gmail.com>
 <4bd14bff-9689-7943-9319-908b74139617@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=aYeK=TG=gmail.com=andrii.anisov@srs-us1.protection.inumbo.net>)
 id 1hNYr6-0007mh-AO
 for xen-devel@lists.xenproject.org; Mon, 06 May 2019 08:20:12 +0000
Received: by mail-lj1-x244.google.com with SMTP id c6so4853055lji.11
 for <xen-devel@lists.xenproject.org>; Mon, 06 May 2019 01:20:11 -0700 (PDT)
In-Reply-To: <4bd14bff-9689-7943-9319-908b74139617@arm.com>
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
Cc: Oleksandr_Tyshchenko@epam.com, sstabellini@kernel.org, Andrii_Anisov@epam.com
List-Id: xen-devel@lists.xenproject.org

SGVsbG8gSnVsaWVuLAoKT24gMDMuMDUuMTkgMjA6MTksIEp1bGllbiBHcmFsbCB3cm90ZToKPiBU
TERSOyBiZWNhdXNlIHhlbiBwYWdlLXRhYmxlcyBhcmUgbm90IHRoYXQgb2Z0ZW4gbW9kaWZpZWQg
YWZ0ZXIgYm9vdC4gWWV0IGl0IGlzIHN0aWxsIHBvc3NpYmxlIHRvIHJhY2UuCj4gCj4gQXQgdGhl
IG1vbWVudCwgY3JlYXRlX3hlbl9lbnRyaWVzKCkgY2FuIG9ubHkgbW9kaWZ5IHRoZSBWQSByYW5n
ZSAwIC0gMkdCLiBJbiB0aGF0IHJhbmdlLCB3ZSBjYW4gbW9kaWZ5IGF0IHJ1bnRpbWUgdGhlIFZN
QVAgYXJlYS4gT25lIHBvdGVudGlhbCBpc3N1ZSBpcwo+IGEgdm1hcCBpc3N1ZWQgYXQgdGhlIHNh
bWUgdGltZS4KPiAKPiBXaGlsZSB0aGUgcmFuZ2UgYWxsb2NhdGlvbiBpcyBwcm90ZWN0ZWQgYnkg
YSBsb2NrIChzZWUgdm1fYWxsb2MpLCB0aGUgbWFwcGluZyBpcyBub3QuIFNvIGl0IHdvdWxkIGJl
IHBvc3NpYmxlIHRvIGVuZCB1cCBtb2RpZnlpbmcgdGhlIHBhZ2UtdGFibGUgYXQgdGhlIHNhbWUu
IFRoYXQgY291bGQgYmxvdyB1cCBpZiBmb3IgaW5zdGFuY2UsIHRoZSBzZWNvbmQtbGV2ZWwgZW50
cnkgaXMgaW52YWxpZCBhcyB3ZSB3b3VsZCBuZWVkIHRvIGFsbG9jYXRlIG1lbW9yeSAob25seSBv
bmUgY2FuIHdpbiB0aGF0IHJhY2UpLgoKSSB1bmRlcnN0YW5kIHRoZSBwb3RlbnRpYWwgcmFjZSwg
YnV0IHN0aWxsIHdvbmRlcmluZyB3aHkgZGlkbid0IHdlIHNlZSB0aG9zZSBpc3N1ZXMuIE1heWJl
IHdlIGFyZSB0b28gbHVja3kuCgo+IEluIGdlbmVyYWwsIGl0IGlzIGEgc2FuZXIgYXBwcm9hY2gg
dG8gdHJ5IHRvIHNlcmlhbGl6ZSB0aGUgbW9kaWZpY2F0aW9ucyBpbiB0aGUgcGFnZS10YWJsZXMu
IFNvIHlvdSBjYW4gc2FmZWx5IHJlYWQgYW4gZW50cnksIGNoZWNrIGl0IGFuZCB0aGVuIHVwZGF0
ZSBpdC4KCllldCwgSSB0aGluayB3ZSB3b3VsZCBzdGljayBhdCB0aGVzZSBsb2NrcyBmb3Igbm93
LgoKLS0gClNpbmNlcmVseSwKQW5kcmlpIEFuaXNvdi4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
