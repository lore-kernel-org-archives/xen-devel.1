From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] libxl: make sure buffer is null-terminated
 in libxl_read_file_contents [and 3 more messages]
Date: Thu, 28 Jun 2018 12:40:05 +0100
Message-ID: <20180628114005.cefc47zlyvxhb55m@citrix.com>
References: <1530090791-5210-1-git-send-email-robinlee.sysu@gmail.com>
 <20180627105835.vxkdh6txjm5hheqa@citrix.com>
 <CAG8B0OwkyaEmPSqjf6=ci48r7BRVs1qjdB9dJM+e0Mo4yMY_Hw@mail.gmail.com>
 <20180627112433.42tk4l7jhqweqvwt@citrix.com>
 <CAG8B0Ox4yVuaf3nbLLGw8dNoHoxQ=_q==NvQ=Cop74x7bgKvZw@mail.gmail.com>
 <20180627122926.tqq5cfk3toypmqqq@citrix.com>
 <CAG8B0OwC1m4ZAS5_DUj67SzgR5qgyW3hzb_+ZAatiY6-FGA=Aw@mail.gmail.com>
 <23348.46954.482917.689734@mariner.uk.xensource.com>
 <20180628112021.cz3w3ga3zsxvfyib@citrix.com>
 <23348.51210.927929.595848@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=dpmo=jo=citrix.com=prvs=7101e345a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1fYVHZ-0004oN-3d
 for xen-devel@lists.xenproject.org; Thu, 28 Jun 2018 11:40:13 +0000
Content-Disposition: inline
In-Reply-To: <23348.51210.927929.595848@mariner.uk.xensource.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Robin Lee <robinlee.sysu@gmail.com>, xen-devel@lists.xenproject.org, Wei Liu <wei.liu2@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKdW4gMjgsIDIwMTggYXQgMTI6MzU6MzhQTSArMDEwMCwgSWFuIEphY2tzb24gd3Jv
dGU6Cj4gV2VpIExpdSB3cml0ZXMgKCJSZTogW1hlbi1kZXZlbF0gW1BBVENIXSBsaWJ4bDogbWFr
ZSBzdXJlIGJ1ZmZlciBpcyBudWxsLXRlcm1pbmF0ZWQgaW4gbGlieGxfcmVhZF9maWxlX2NvbnRl
bnRzIFthbmQgMyBtb3JlIG1lc3NhZ2VzXSIpOgo+ID4gV2UgY2FuIHNhZmVseSByZW1vdmUgdGhl
IHRyYWlsaW5nIG51bCBpZiBsaWJ4bCBBUEkgbWFrZXMgc3VyZSBhIGJ1ZmZlcgo+ID4gaXMgbnVs
LXRlcm1pbmF0ZWQuIE9sZCBmaWxlcyB3aWxsIHN0aWxsIHdvcmsgd2l0aCBuZXcgbGlicmFyeS4g
TmV3IGZpbGVzCj4gPiB3b24ndCB3b3JrIHdpdGggb2xkIGxpYnJhcnkgLS0gYnV0IHdlIGRvbid0
IHN1cHBvcnQgdGhhdC4KPiAKPiBJIGd1ZXNzLgo+IAo+ID4gPiBJIGFtIGluY2xpbmVkIHRvIHRo
aW5rIHRoYXQgc29tZXRoaW5nIGFsb25nIHRoZSBsaW5lcyBvZiB0aGUgb3JpZ2luYWwKPiA+ID4g
cGF0Y2ggaXMgdGhlIHdheSB0byBkbyB0aGF0LiAgQWx0aG91Z2gsIHRoaXMgZXh0cmEgbnVsIGJ5
dGUgc2hvdWxkIGJlCj4gPiA+IGRvY3VtZW50ZWQgaW4gdGhlIEFQSSBjb21tZW50IHRoZW4uCj4g
PiA+IAo+ID4gPiBBbHNvLCB3ZSBzaG91bGQgaWRlbnRpZnkgd2hlcmUgdGhlIGFkZGl0aW9uYWwg
bnVsIGJ5dGUgaXMgY29taW5nCj4gPiA+IGZyb20uICBXaGlsZSB3ZSBjYW4ndCBqdXN0IGRlbGV0
ZSB0aGF0LCB3ZSBzaG91bGQgcHV0IGEgY29tbWVudCBpbgo+ID4gPiBzYXlpbmcgdGhhdCB0aGUg
b2ZmLWJ5LW9uZSBlcnJvciBpcyBkZWxpYmVyYXRlLgo+ID4gCj4gPiBXaGF0IG9mZi1ieS1vbmUg
ZXJyb3I/Cj4gCj4gVGhlIG9uZSB0aGF0IHdyaXRlcyBhIG51bCB0byB0aGUgZmlsZS4gIEkgY2Fu
J3QgYmVsaWV2ZSBpdCB3YXMKPiBkZWxpYmVyYXRlLiAgSSBoYXZlbid0IGxvb2tlZCB0byBmaW5k
IHdoZXJlIGl0IGNvbWVzIGZyb20gYnV0IGlmIHRoZQo+IGNvZGUgd2hlcmUgaXQgY29tZXMgZnJv
bSBkb2Vzbid0IGxvb2sgbGlrZSBhbiBvZmYtYnktb25lIGVycm9yIHRoZW4gaXQKPiBpcyB0b28g
b2J0dXNlIDotKS4KCkl0IGlzIGRlbGliZXJhdGUuIFNlZSBsaWJ4bF9pbnRlcm5hbC5oOmxpYnhs
X19zZXRfZG9tYWluX2NvbmZpZ3VyYXRpb24uCgpBdCB0aGUgdGltZSBJIHdyb3RlIHRoZSBjb2Rl
IEkgZGlkbid0IHdhbnQgdG8gY2hhbmdlIHRoZSByZWFkL3dyaXRlCmZ1bmN0aW9uIEFQSXMuIFRo
ZSBmaWxlIHdhcyAvIGlzIGNvbnNpZGVyZWQgaW50ZXJuYWwgYW55d2F5LgoKV2VpLgoKPiAKPiBJ
YW4uCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
