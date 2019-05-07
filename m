From: Juergen Gross <jgross@suse.com>
Subject: Re: [PATCH 4/5] xen: fix handling framebuffer located
 above 4GB
Date: Tue, 7 May 2019 07:07:58 +0200
Message-ID: <08beb838-2b30-4efd-ab84-8bacd4ed9061@suse.com>
References: <cover.5027956268821f50401d0ecdfad2447cbe4fdd6c.1557154206.git-series.marmarek@invisiblethingslab.com>
 <dfffbc1faf0884df46f5568cdcf9fa8c2340ae2b.1557154206.git-series.marmarek@invisiblethingslab.com>
 <7c7a7dcc-ff17-feb7-1e88-96c31b0e72a7@suse.com>
 <20190506153211.GV1502@mail-itl>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=l9RI=TH=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1hNsKq-0007af-41
 for xen-devel@lists.xenproject.org; Tue, 07 May 2019 05:08:12 +0000
In-Reply-To: <20190506153211.GV1502@mail-itl>
Content-Language: de-DE
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: =?UTF-8?Q?Marek_Marczykowski-G=c3=b3recki?= <marmarek@invisiblethingslab.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Julien Grall <julien.grall@arm.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org, =?UTF-8?Q?Roger_Pau_Monn=c3=a9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMDYvMDUvMjAxOSAxNzozMiwgTWFyZWsgTWFyY3p5a293c2tpLUfDs3JlY2tpIHdyb3RlOgo+
IE9uIE1vbiwgTWF5IDA2LCAyMDE5IGF0IDA1OjE1OjE5UE0gKzAyMDAsIEp1ZXJnZW4gR3Jvc3Mg
d3JvdGU6Cj4+IE9uIDA2LzA1LzIwMTkgMTY6NTAsIE1hcmVrIE1hcmN6eWtvd3NraS1Hw7NyZWNr
aSB3cm90ZToKPj4+IGRpZmYgLS1naXQgYS94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmggYi94ZW4v
aW5jbHVkZS9wdWJsaWMveGVuLmgKPj4+IGluZGV4IGNjZGZmYzAuLmIwZjBmN2UgMTAwNjQ0Cj4+
PiAtLS0gYS94ZW4vaW5jbHVkZS9wdWJsaWMveGVuLmgKPj4+ICsrKyBiL3hlbi9pbmNsdWRlL3B1
YmxpYy94ZW4uaAo+Pj4gQEAgLTkyMyw2ICs5MjMsOCBAQCB0eXBlZGVmIHN0cnVjdCBkb20wX3Zn
YV9jb25zb2xlX2luZm8gewo+Pj4gICAgICAgICAgICAgIC8qIE1vZGUgYXR0cmlidXRlcyAob2Zm
c2V0IDB4MCwgVkVTQSBjb21tYW5kIDB4NGYwMSkuICovCj4+PiAgICAgICAgICAgICAgdWludDE2
X3QgbW9kZV9hdHRyczsKPj4+ICAjZW5kaWYKPj4+ICsgICAgICAgICAgICAvKiBoaWdoIDMyIGJp
dHMgb2YgbGZiX2Jhc2UgKi8KPj4+ICsgICAgICAgICAgICB1aW50MzJfdCBleHRfbGZiX2Jhc2U7
Cj4+Cj4+IFlvdSB3aWxsIG5lZWQgdG8gcHV0IHRoaXMgYWRkaXRpb24gaW50byBhbjoKPj4KPj4g
I2lmIF9fWEVOX0lOVEVSRkFDRV9WRVJTSU9OX18gPj0gMHgwMDA0MGQwMAo+PiAuLi4KPj4gI2Vu
ZGlmCj4+Cj4+IHNlY3Rpb24gKG9ubHkgYXZhaWxhYmxlIGZyb20gWGVuIDQuMTMgb253YXJkcyku
Cj4gCj4gV2h5IGV4YWN0bHk/IEkgZG9uJ3Qgc2VlIHRoaXMgc3RydWN0dXJlIHVzZWQgaW4gYW55
IGh5cGVyY2FsbCBhcmd1bWVudC4KPiBUaGUgb25seSBleHRlcm5hbGx5IGFjY2Vzc2libGUgcGxh
Y2UgaXMgc3RhcnRfaW5mbyBzdHJ1Y3R1cmUsIHdoZXJlIGl0Cj4gaGFzIGV4cGxpY2l0IHN0cnVj
dCBzaXplIGFscmVhZHkuCgpXaXRoIHRoZSAjaWZkZWYuLi4jZW5kaWYganVzdCBhYm92ZSB5b3Vy
IGFkZGl0aW9uIGEgY29uc3VtZXIgdXNpbmcgYW4KaW50ZXJmYWNlIHZlcnNpb24gPCAweDAwMDMw
MjA2IGNvdWxkIHRoaW5rIGdibF9jYXBzIGlzIGF2YWlsYWJsZSBpbnN0ZWFkCm9mIGV4dF9sZmJf
YmFzZS4KCgpKdWVyZ2VuCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0
Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRl
dmVs
