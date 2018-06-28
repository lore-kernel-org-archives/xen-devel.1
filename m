From: Ian Jackson <ian.jackson@citrix.com>
Subject: Re: [PATCH] libxl: make sure buffer is null-terminated
 in libxl_read_file_contents [and 3 more messages]
Date: Thu, 28 Jun 2018 12:35:38 +0100
Message-ID: <23348.51210.927929.595848@mariner.uk.xensource.com>
References: <1530090791-5210-1-git-send-email-robinlee.sysu@gmail.com>
 <20180627105835.vxkdh6txjm5hheqa@citrix.com>
 <CAG8B0OwkyaEmPSqjf6=ci48r7BRVs1qjdB9dJM+e0Mo4yMY_Hw@mail.gmail.com>
 <20180627112433.42tk4l7jhqweqvwt@citrix.com>
 <CAG8B0Ox4yVuaf3nbLLGw8dNoHoxQ=_q==NvQ=Cop74x7bgKvZw@mail.gmail.com>
 <20180627122926.tqq5cfk3toypmqqq@citrix.com>
 <CAG8B0OwC1m4ZAS5_DUj67SzgR5qgyW3hzb_+ZAatiY6-FGA=Aw@mail.gmail.com>
 <23348.46954.482917.689734@mariner.uk.xensource.com>
 <20180628112021.cz3w3ga3zsxvfyib@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=3gz1=jo=citrix.com=prvs=710363d4d=ian.jackson@srs-us1.protection.inumbo.net>)
 id 1fYVDC-00041i-O9
 for xen-devel@lists.xenproject.org; Thu, 28 Jun 2018 11:35:42 +0000
In-Reply-To: <20180628112021.cz3w3ga3zsxvfyib@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>
Cc: Robin Lee <robinlee.sysu@gmail.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

V2VpIExpdSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIXSBsaWJ4bDogbWFrZSBzdXJl
IGJ1ZmZlciBpcyBudWxsLXRlcm1pbmF0ZWQgaW4gbGlieGxfcmVhZF9maWxlX2NvbnRlbnRzIFth
bmQgMyBtb3JlIG1lc3NhZ2VzXSIpOgo+IFdlIGNhbiBzYWZlbHkgcmVtb3ZlIHRoZSB0cmFpbGlu
ZyBudWwgaWYgbGlieGwgQVBJIG1ha2VzIHN1cmUgYSBidWZmZXIKPiBpcyBudWwtdGVybWluYXRl
ZC4gT2xkIGZpbGVzIHdpbGwgc3RpbGwgd29yayB3aXRoIG5ldyBsaWJyYXJ5LiBOZXcgZmlsZXMK
PiB3b24ndCB3b3JrIHdpdGggb2xkIGxpYnJhcnkgLS0gYnV0IHdlIGRvbid0IHN1cHBvcnQgdGhh
dC4KCkkgZ3Vlc3MuCgo+ID4gSSBhbSBpbmNsaW5lZCB0byB0aGluayB0aGF0IHNvbWV0aGluZyBh
bG9uZyB0aGUgbGluZXMgb2YgdGhlIG9yaWdpbmFsCj4gPiBwYXRjaCBpcyB0aGUgd2F5IHRvIGRv
IHRoYXQuICBBbHRob3VnaCwgdGhpcyBleHRyYSBudWwgYnl0ZSBzaG91bGQgYmUKPiA+IGRvY3Vt
ZW50ZWQgaW4gdGhlIEFQSSBjb21tZW50IHRoZW4uCj4gPiAKPiA+IEFsc28sIHdlIHNob3VsZCBp
ZGVudGlmeSB3aGVyZSB0aGUgYWRkaXRpb25hbCBudWwgYnl0ZSBpcyBjb21pbmcKPiA+IGZyb20u
ICBXaGlsZSB3ZSBjYW4ndCBqdXN0IGRlbGV0ZSB0aGF0LCB3ZSBzaG91bGQgcHV0IGEgY29tbWVu
dCBpbgo+ID4gc2F5aW5nIHRoYXQgdGhlIG9mZi1ieS1vbmUgZXJyb3IgaXMgZGVsaWJlcmF0ZS4K
PiAKPiBXaGF0IG9mZi1ieS1vbmUgZXJyb3I/CgpUaGUgb25lIHRoYXQgd3JpdGVzIGEgbnVsIHRv
IHRoZSBmaWxlLiAgSSBjYW4ndCBiZWxpZXZlIGl0IHdhcwpkZWxpYmVyYXRlLiAgSSBoYXZlbid0
IGxvb2tlZCB0byBmaW5kIHdoZXJlIGl0IGNvbWVzIGZyb20gYnV0IGlmIHRoZQpjb2RlIHdoZXJl
IGl0IGNvbWVzIGZyb20gZG9lc24ndCBsb29rIGxpa2UgYW4gb2ZmLWJ5LW9uZSBlcnJvciB0aGVu
IGl0CmlzIHRvbyBvYnR1c2UgOi0pLgoKSWFuLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlz
dHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbA==
