From: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Subject: Re: [PATCH qemu-xen-traditional] xen/pt: allow QEMU to
 request MSI unmasking at bind time
Date: Mon, 18 Jun 2018 13:43:52 +0200
Message-ID: <20180618114352.xelerr457ev2e5kj@mac>
References: <1527058885.8186.68.camel@infradead.org>
 <1529314520-79691-1-git-send-email-andraprs@amazon.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=yi+h=je=citrix.com=prvs=7002a29bc=roger.pau@srs-us1.protection.inumbo.net>)
 id 1fUsZl-0004lC-Ro
 for xen-devel@lists.xenproject.org; Mon, 18 Jun 2018 11:44:01 +0000
Content-Disposition: inline
In-Reply-To: <1529314520-79691-1-git-send-email-andraprs@amazon.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andra Paraschiv <andraprs@amazon.com>
Cc: xen-devel@lists.xenproject.org, sstabellini@kernel.org, dwmw@amazon.co.uk, jbeulich@suse.com, andrew.cooper3@citrix.com
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBKdW4gMTgsIDIwMTggYXQgMDk6MzU6MjBBTSArMDAwMCwgQW5kcmEgUGFyYXNjaGl2
IHdyb3RlOgo+IFdoZW4gYSBNU0kgaW50ZXJydXB0IGlzIGJvdW5kIHRvIGEgZ3Vlc3QgdXNpbmcK
PiB4Y19kb21haW5fdXBkYXRlX21zaV9pcnEgKFhFTl9ET01DVExfYmluZF9wdF9pcnEpIHRoZSBp
bnRlcnJ1cHQgaXMKPiBsZWZ0IG1hc2tlZCBieSBkZWZhdWx0Lgo+IAo+IFRoaXMgY2F1c2VzIHBy
b2JsZW1zIHdpdGggZ3Vlc3RzIHRoYXQgZmlyc3QgY29uZmlndXJlIGludGVycnVwdHMgYW5kCj4g
Y2xlYW4gdGhlIHBlci1lbnRyeSBNU0lYIHRhYmxlIG1hc2sgYml0IGFuZCBhZnRlcndhcmRzIGVu
YWJsZSBNU0lYCj4gZ2xvYmFsbHkuIEluIHN1Y2ggc2NlbmFyaW8gdGhlIFhlbiBpbnRlcm5hbCBt
c2l4dGJsIGhhbmRsZXJzIHdvdWxkIG5vdAo+IGRldGVjdCB0aGUgdW5tYXNraW5nIG9mIE1TSVgg
ZW50cmllcyBiZWNhdXNlIHZlY3RvcnMgYXJlIG5vdCB5ZXQKPiByZWdpc3RlcmVkIHNpbmNlIE1T
SVggaXMgbm90IGVuYWJsZWQsIGFuZCB2ZWN0b3JzIHdvdWxkIGJlIGxlZnQKPiBtYXNrZWQuCj4g
Cj4gSW50cm9kdWNlIGEgbmV3IGZsYWcgaW4gdGhlIGdmbGFncyBmaWVsZCB0byBzaWduYWwgWGVu
IHdoZXRoZXIgYSBNU0kKPiBpbnRlcnJ1cHQgc2hvdWxkIGJlIHVubWFza2VkIGFmdGVyIGJlaW5n
IGJvdW5kLgo+IAo+IFRoaXMgYWxzbyByZXF1aXJlcyB0byB0cmFjayB0aGUgbWFzayByZWdpc3Rl
ciBmb3IgTVNJIGludGVycnVwdHMsIHNvCj4gUUVNVSBjYW4gYWxzbyBub3RpZnkgdG8gWGVuIHdo
ZXRoZXIgdGhlIE1TSSBpbnRlcnJ1cHQgc2hvdWxkIGJlIGJvdW5kCj4gbWFza2VkIG9yIHVubWFz
a2VkCj4gCj4gU2lnbmVkLW9mZi1ieTogUm9nZXIgUGF1IE1vbm7DqSA8cm9nZXIucGF1QGNpdHJp
eC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KPiBS
ZXBvcnRlZC1ieTogQW5kcmVhcyBLaW56bGVyIDxoZnBAcG9zdGVvLmRlPgo+IFJldmlld2VkLWJ5
OiBTdGVmYW5vIFN0YWJlbGxpbmkgPHNzdGFiZWxsaW5pQGtlcm5lbC5vcmc+Cj4gU2lnbmVkLW9m
Zi1ieTogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGluaUBrZXJuZWwub3JnPgo+IAo+IFtC
YWNrcG9ydGVkIGZyb20gY29tbWl0IGE4MDM2MzM2NjA5ZDJlMTg0ZmMzNTQzYTRjNDM5YzBiYTdk
N2YzYTIKPiAgaHR0cHM6Ly9naXQucWVtdS5vcmcvP3A9cWVtdS5naXQ7YT1jb21taXQ7aD1hODAz
NjMzNjYwOWQyZTE4NGZjMzU0M2E0YzQzOWMwYmE3ZDdmM2EyCj4gIGh0dHBzOi8veGVuYml0cy54
ZW4ub3JnL2dpdHdlYi8/cD1xZW11LXhlbi5naXQ7YT1jb21taXQ7aD1hODAzNjMzNjYwOWQyZTE4
NGZjMzU0M2E0YzQzOWMwYmE3ZDdmM2EyXQo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJhIFBhcmFz
Y2hpdiA8YW5kcmFwcnNAYW1hem9uLmNvbT4KClRoYW5rcyBmb3IgZG9pbmcgdGhlIGJhY2twb3J0
LCBMR1RNLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
WGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0
cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
