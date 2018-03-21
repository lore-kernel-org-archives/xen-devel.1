From: Alexey G <x1917x@gmail.com>
Subject: Re: [RFC PATCH 07/12] hvmloader: allocate MMCONFIG area
 in the MMIO hole + minor code refactoring
Date: Thu, 22 Mar 2018 00:35:19 +1000
Message-ID: <20180322003519.00005ccd@gmail.com>
References: <cover.1520867740.git.x1917x@gmail.com>
 <62c7a3037bb9f5631542f635dc36ae3338c7bf47.1520867741.git.x1917x@gmail.com>
 <20180319155802.immvsgqttrs3yezg@MacBook-Pro-de-Roger.local>
 <20180320054922.00005669@gmail.com>
 <20180320085048.orjv67qtwhe35ntl@MacBook-Pro-de-Roger.local>
 <20180321105840.00004698@gmail.com>
 <20180321090911.qd6epofdaywc4blb@MacBook-Pro-de-Roger.local>
 <c2eee6cbf59e4bdc816c66ec0637388a@AMSPEX02CL03.citrite.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=gotp=gl=gmail.com=x1917x@srs-us1.protection.inumbo.net>)
 id 1eyepx-0005xX-0r
 for xen-devel@lists.xenproject.org; Wed, 21 Mar 2018 14:35:33 +0000
Received: by mail-lf0-x22c.google.com with SMTP id y2-v6so8209454lfc.5
 for <xen-devel@lists.xenproject.org>; Wed, 21 Mar 2018 07:35:31 -0700 (PDT)
In-Reply-To: <c2eee6cbf59e4bdc816c66ec0637388a@AMSPEX02CL03.citrite.net>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <Paul.Durrant@citrix.com>
Cc: Wei Liu <wei.liu2@citrix.com>, Andrew Cooper <Andrew.Cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, Ian Jackson <Ian.Jackson@citrix.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCAyMSBNYXIgMjAxOCAwOTozNjowNCArMDAwMApQYXVsIER1cnJhbnQgPFBhdWwuRHVy
cmFudEBjaXRyaXguY29tPiB3cm90ZToKPj4gCj4+IEFsdGhvdWdoIHRoaXMgaXMgdGhlIG1vc3Qg
Y29tbW9uIHNjZW5hcmlvLCBpdCdzIG5vdCB0aGUgb25seSBvbmUKPj4gc3VwcG9ydGVkIGJ5IFhl
bi4gWW91ciBwcm9wb3NlZCBzb2x1dGlvbiBicmVha3MgdGhlIHVzYWdlIG9mIG11bHRpcGxlCj4+
IElPUkVRIHNlcnZlcnMgYXMgUENJIGRldmljZSBlbXVsYXRvcnMuCj4KPkluZGVlZCBpdCB3aWxs
LCBhbmQgdGhhdCBpcyBub3QgYWNjZXB0YWJsZSBldmVuIGluIHRoZSBzaG9ydCB0ZXJtLgoKSG1t
LCB3aGF0IGV4YWN0bHkgeW91IGFyZSByZWplY3Rpbmc/IFFFTVUncyB1c2FnZSBvZiBlc3RhYmxp
c2hlZCAoYW5kCnByb3ZpZGVkIGJ5IFhlbikgaW50ZXJmYWNlcyBmb3IgUUVNVSB0byB1c2U/IEFu
eSBwYXJ0aWN1bGFyIHJlYXNvbiB3aHkKUUVNVSBjYW4gdXNlIG1hcF9pb19yYW5nZV90b19pb3Jl
cV9zZXJ2ZXIoKSBpbiBvbmUgY2FzZSBhbmQgY2FuJ3QgaW4KYW5vdGhlcj8gSXQncyBBUEkgYXZh
aWxhYmxlIGZvciBRRU1VIGFmdGVyIGFsbC4KCklmIHdlIGFjdHVhbGx5IHN3aXRjaCB0byB0aGUg
ZW11bGF0ZWQgTU1DT05GSUcgcmFuZ2UgaW5mb3JtaW5nIGFwcHJvYWNoCmZvciBYZW4gKHZpYSBh
IG5ldyBkbW9wL2h5cGVyY2FsbCksIHdobyBzaG91bGQgcHJldmVudCBRRU1VIHRvIGFjdHVhbGx5
Cm1hcCB0aGlzIHJhbmdlIHZpYSBtYXBfaW9fcmFuZ2VfdG9faW9yZXFfc2VydmVyPyBRRU1VIGl0
c2VsZj8gT3IgWGVuPwpIb3cgdG8gd2lsbCBsb29rLCAiUUVNVSBhc2tzIHVzIHRvIG1hcCB0aGlz
IHJhbmdlIGFzIGVtdWxhdGVkIE1NSU8sIGJ1dApoZSBwcmV2aW91c2x5IHRvbGQgdXMgdGhhdCBl
bXVsYXRlZCBQQ0lFWEJBUiByZWdpc3RlciBwb2ludHMgdGhlcmUsIHNvCndlIHdvbid0IGFsbG93
IGhpbSB0byBkbyBpdCI/Cgo+PiA+IEkgdGhpbmsgaXQgd2lsbCBiZSBzYWZlIHRvIHVzZSBNTUNP
TkZJRyBlbXVsYXRpb24gb24gTU1JTyBsZXZlbAo+PiA+IGZvciBub3cgYW5kIGxhdGVyIGV4dGVu
ZCBpdCB3aXRoICdzZXRfbW1jb25maWdfJyBkbW9wL2h5cGVyY2FsbAo+PiA+IGZvciB0aGUgJ211
bHRpcGxlIGRldmljZSBlbXVsYXRvcnMnIElPUkVRX1RZUEVfQ09QWSByb3V0aW5nIHRvCj4+ID4g
d29yayBzYW1lIGFzIGZvciBQQ0kgY29uZiwgc28gaXQgY2FuIGJlIHVzZWQgYnkgWGVuR1QgZXRj
IG9uIFEzNQo+PiA+IGFzIHdlbGwuICAKPkludHJvZHVjaW5nIGtub3duIGJyZWFrYWdlIGlzIG5v
dCByZWFsbHkgb24sIHBhcnRpY3VsYXJseSB3aGVuIGl0IGNhbgo+YmUgYXZvaWRlZCB3aXRoIGEg
cmVhc29uYWJsZSBhbW91bnQgb2YgZXh0cmEgd29yay4KCkl0J3MgaGFyZCB0byBicmVhayBzb21l
dGhpbmcgd2hpY2ggZG9lc24ndCBleGlzdC4gOikgTXVsdGlwbGUgZGV2aWNlCmVtdWxhdG9ycyBm
ZWF0dXJlIGRvIG5vdCBzdXBwb3J0IHRyYW5zbGF0aW9uL3JvdXRpbmcgb2YgTU1DT05GSUcgTU1J
TwphY2Nlc3NlcyBjdXJyZW50bHksIGl0IG11c3QgYmUgZGVzaWduZWQgZmlyc3QuCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
