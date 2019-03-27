From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 1/6] xen/sched: call cpu_disable_scheduler()
 via cpu notifier
Date: Wed, 27 Mar 2019 17:53:46 +0100
Message-ID: <6b1cfffb-02ae-4859-94aa-29676b0c18da@suse.com>
References: <20190318131155.29450-1-jgross@suse.com>
 <20190318131155.29450-2-jgross@suse.com>
 <42e0d691a0e00149ba585382e26494159dbb71f9.camel@suse.com>
 <7090ec7b-e37b-35d2-67d9-97c32369fe8c@suse.com>
 <4585c758d5e6928acf5ed714ad5f13bf3991492f.camel@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=BLRb=R6=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1h9BoD-0000Ho-Qb
 for xen-devel@lists.xenproject.org; Wed, 27 Mar 2019 16:53:49 +0000
In-Reply-To: <4585c758d5e6928acf5ed714ad5f13bf3991492f.camel@suse.com>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>, xen-devel@lists.xenproject.org
Cc: George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMjcvMDMvMjAxOSAxNzo1MSwgRGFyaW8gRmFnZ2lvbGkgd3JvdGU6Cj4gT24gV2VkLCAyMDE5
LTAzLTI3IGF0IDE3OjMxICswMTAwLCBKdWVyZ2VuIEdyb3NzIHdyb3RlOgo+PiBPbiAyNy8wMy8y
MDE5IDE3OjI0LCBEYXJpbyBGYWdnaW9saSB3cm90ZToKPj4+IE9uIE1vbiwgMjAxOS0wMy0xOCBh
dCAxNDoxMSArMDEwMCwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4+PiBjcHVfZGlzYWJsZV9zY2hl
ZHVsZXIoKSBpcyBiZWluZyBjYWxsZWQgZnJvbSBfX2NwdV9kaXNhYmxlKCkKPj4+PiB0b2RheS4K
Pj4+PiBUaGVyZSBpcyBubyBuZWVkIHRvIGNhbGwgaXQgb24gdGhlIGNwdSBqdXN0IGJlaW5nIGRp
c2FibGVkLCBzbwo+Pj4+IHVzZQo+Pj4+IHRoZSBDUFVfREVBRCBjYXNlIG9mIHRoZSBjcHUgbm90
aWZpZXIgY2hhaW4uCj4+Pj4KPj4+IFNvLCB3aGF0IGRvIHlvdSBtZWFuIHdpdGggIlRoZXJlIGlz
IG5vIG5lZWQgdG8gY2FsbCBpdCBvbiB0aGUgY3B1Cj4+PiBqdXN0Cj4+PiBiZWluZyBkaXNhYmxl
ZCI/Cj4+Pgo+Pj4gQmVjYXVzZSB3ZSBzdGlsbCAoZXZlbiBhZnRlciB0aGlzIHBhdGNoLCBJIG1l
YW4pIGNhbGwKPj4+IGNwdV9kaXNhYmxlX3NjaGVkdWxlcigpIG9uIGFsbCBub24tYm9vdCBDUFVz
LCBhcmVuJ3Qgd2U/IEl0J3MganVzdAo+Pj4gdGhhdAo+Pj4gcmlnaHQgbm93IHdlIGNhbGwgaXQg
ZnJvbSBfX2NwdV9kaXNhYmxlKCksIHdpdGggdGhlIHBhdGNoIHdlIGNhbGwKPj4+IGl0Cj4+PiBz
bGlnaHRseSBsYXRlci4KPj4KPj4gVGhlIENQVV9ERUFEIG5vdGlmaWVyIGNoYWluIGlzIGNhbGxl
ZCBvbiB0aGUgQ1BVIHJlcXVlc3RpbmcgdGhlIG90aGVyCj4+IG9uZSB0byBnbyBkb3duIChzbyBv
biB0aGUgYm9vdCBDUFUgaW4gc3VzcGVuZCBjYXNlKS4gU28gd2UgY2FsbCBpdAo+PiBfZm9yXwo+
PiBhbGwgbm9uLWJvb3QgQ1BVcyBpbiB0aGUgYm9vdCBDUFUuCj4+Cj4gTW1tLi4uIG9rLCBJIHNl
ZSB3aGF0IHlvdSBtZWFuIG5vdy4KPiAKPiBJIGd1ZXNzIHBhcnQgb2YgInRoZSBwcm9ibGVtIiBp
cyB0aGF0ICJjYWxsIGZ1bmMgb24gY3B1IEEiIHJlYWRzLCBhdAo+IGxlYXN0IHRvIG1lLCBhcyBi
b3RoIDEpIGNhbGwgZnVuYyBzbyB0aGF0IGl0IGFjdHMgb24gYW5kIGNoYW5nZSB0aGUKPiBzdGF0
ZSBvZiBjcHUgQSwgYW5kIDIpIGNhbGwgZnVuYyBpbiBzdWNoIGEgd2F5IHRoYXQgaXQgZXhlY3V0
ZXMgb24gY3B1Cj4gQS4KCkknbGwgcmVwaHJhc2UgdG8gImV4ZWN1dGUgZnVuYyBvbiBjcHUuLi4i
LgoKCkp1ZXJnZW4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
