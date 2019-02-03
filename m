From: Christopher Clark <christopher.w.clark@gmail.com>
Subject: Re: [PATCH v7 10/15] argo: implement the notify op
Date: Sun, 3 Feb 2019 10:08:44 -0800
Message-ID: <CACMJ4GamwA3Q3a2x1UmA28KEJQvKHJ0-v=t9_7ZFsrRaxZ5JAw@mail.gmail.com>
References: <1548908900-1128-1-git-send-email-christopher.w.clark@gmail.com>
 <1548908900-1128-11-git-send-email-christopher.w.clark@gmail.com>
 <20190131164516.dtnb5t7potvruhuc@mac>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=Xau/=QK=gmail.com=christopher.w.clark@srs-us1.protection.inumbo.net>)
 id 1gqMCQ-0000xW-HP
 for xen-devel@lists.xenproject.org; Sun, 03 Feb 2019 18:08:58 +0000
Received: by mail-lj1-x242.google.com with SMTP id u89-v6so9860698lje.1
 for <xen-devel@lists.xenproject.org>; Sun, 03 Feb 2019 10:08:57 -0800 (PST)
In-Reply-To: <20190131164516.dtnb5t7potvruhuc@mac>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Roger_Pau_Monn=C3=A9?= <roger.pau@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Ross Philipson <ross.philipson@gmail.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jason Andryuk <jandryuk@gmail.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Rich Persaud <persaur@gmail.com>, Tim Deegan <tim@xen.org>, Daniel Smith <dpsmith@apertussolutions.com>, Julien Grall <julien.grall@arm.com>, Paul Durrant <paul.durrant@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>, James McKenzie <james@bromium.com>, Eric Chanudet <eric.chanudet@gmail.com>
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBKYW4gMzEsIDIwMTkgYXQgODo0NSBBTSBSb2dlciBQYXUgTW9ubsOpIDxyb2dlci5w
YXVAY2l0cml4LmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIEphbiAzMCwgMjAxOSBhdCAwODoyODox
NVBNIC0wODAwLCBDaHJpc3RvcGhlciBDbGFyayB3cm90ZToKPiA+IFF1ZXJpZXMgZm9yIGRhdGEg
YWJvdXQgc3BhY2UgYXZhaWxhYmlsaXR5IGluIHJlZ2lzdGVyZWQgcmluZ3MgYW5kCj4gPiBjYXVz
ZXMgbm90aWZpY2F0aW9uIHRvIGJlIHNlbnQgd2hlbiBzcGFjZSBoYXMgYmVjb21lIGF2YWlsYWJs
ZS4KPiA+Cj4gPiBUaGUgaHlwZXJjYWxsIG9wIHBvcHVsYXRlcyBhIHN1cHBsaWVkIGRhdGEgc3Ry
dWN0dXJlIHdpdGggaW5mb3JtYXRpb24gYWJvdXQKPiA+IHJpbmcgc3RhdGUgYW5kIGlmIGluc3Vm
ZmljaWVudCBzcGFjZSBpcyBjdXJyZW50bHkgYXZhaWxhYmxlIGluIGEgZ2l2ZW4gcmluZywKPiA+
IHRoZSBoeXBlcnZpc29yIHdpbGwgcmVjb3JkIHRoZSBkb21haW4ncyBleHByZXNzZWQgaW50ZXJl
c3QgYW5kIG5vdGlmeSBpdAo+ID4gd2hlbiBpdCBvYnNlcnZlcyB0aGF0IHNwYWNlIGhhcyBiZWNv
bWUgYXZhaWxhYmxlLgo+ID4KPiA+IENoZWNrcyBmb3IgZnJlZSBzcGFjZSBvY2N1ciB3aGVuIHRo
aXMgbm90aWZ5IG9wIGlzIGludm9rZWQsIHNvIGl0IG1heSBiZQo+ID4gaW50ZW50aW9uYWxseSBp
bnZva2VkIHdpdGggbm8gZGF0YSBzdHJ1Y3R1cmUgdG8gcG9wdWxhdGUKPiA+IChpZS4gYSBOVUxM
IGFyZ3VtZW50KSB0byB0cmlnZ2VyIHN1Y2ggYSBjaGVjayBhbmQgY29uc2VxdWVudCBub3RpZmlj
YXRpb25zLgo+ID4KPiA+IExpbWl0IHRoZSBtYXhpbXVtIG51bWJlciBvZiBub3RpZnkgcmVxdWVz
dHMgaW4gYSBzaW5nbGUgb3BlcmF0aW9uIHRvIGEKPiA+IHNpbXBsZSBmaXhlZCBsaW1pdCBvZiAy
NTYuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoZXIgQ2xhcmsgPGNocmlzdG9waGVy
LmNsYXJrNkBiYWVzeXN0ZW1zLmNvbT4KPiA+IFRlc3RlZC1ieTogQ2hyaXMgUGF0dGVyc29uIDxw
YXR0ZXJzb25jQGFpbmZvc2VjLmNvbT4KPgo+IFJldmlld2VkLWJ5OiBSb2dlciBQYXUgTW9ubsOp
IDxyb2dlci5wYXVAY2l0cml4LmNvbT4KClRoYW5rcy4KCj4KPiBEZXNwaXRlIHRoZSB1c2FnZSBv
ZiBsaXN0X2Zvcl9lYWNoX2VudHJ5X3NhZmUgaW5zdGVhZCBvZgo+IGxpc3RfZmlyc3RfZW50cnlf
b3JfbnVsbC4KPgo+ID4gK3N0YXRpYyB2b2lkCj4gPiArcGVuZGluZ19ub3RpZnkoc3RydWN0IGxp
c3RfaGVhZCAqdG9fbm90aWZ5KQo+ID4gK3sKPiA+ICsgICAgc3RydWN0IHBlbmRpbmdfZW50ICpl
bnQsICpuZXh0Owo+ID4gKwo+ID4gKyAgICBBU1NFUlQoTE9DS0lOR19SZWFkX0wxKTsKPiA+ICsK
PiA+ICsgICAgLyogU2VuZGluZyBzaWduYWxzIGZvciBhbGwgZW50cyBpbiB0aGlzIGxpc3QsIGRy
YWluaW5nIHVudGlsIGl0IGlzIGVtcHR5LiAqLwo+ID4gKyAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5
X3NhZmUoZW50LCBuZXh0LCB0b19ub3RpZnksIG5vZGUpCj4KPiBsaXN0X2ZpcnN0X2VudHJ5X29y
X251bGwgd291bGQgYmUgbW9yZSBzdWl0YWJsZSBoZXJlLgoKYWNrLCBhcHBsaWVkLgoKQ2hyaXN0
b3BoZXIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
