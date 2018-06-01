From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: Re: [PATCH v4 18/27] xen: Adapt assembly for PIE support
Date: Fri, 1 Jun 2018 11:44:07 -0400
Message-ID: <cfd5f012-4ce2-639b-9ff0-4ad627805fd4__32678.3827775673$1527867584$gmane$org@oracle.com>
References: <20180529221625.33541-1-thgarnie@google.com>
 <20180529221625.33541-19-thgarnie@google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=6ju0=it=oracle.com=boris.ostrovsky@srs-us1.protection.inumbo.net>)
 id 1fOmAi-0000hh-If
 for xen-devel@lists.xenproject.org; Fri, 01 Jun 2018 15:40:56 +0000
In-Reply-To: <20180529221625.33541-19-thgarnie@google.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Thomas Garnier <thgarnie@google.com>, kernel-hardening@lists.openwall.com
Cc: Juergen Gross <jgross@suse.com>, Kate Stewart <kstewart@linuxfoundation.org>, "H.J. Lu" <hjl.tools@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, x86@kernel.org, linux-kernel@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, xen-devel@lists.xenproject.org, Thomas Gleixner <tglx@linutronix.de>
List-Id: xen-devel@lists.xenproject.org

T24gMDUvMjkvMjAxOCAwNjoxNSBQTSwgVGhvbWFzIEdhcm5pZXIgd3JvdGU6Cj4gZGlmZiAtLWdp
dCBhL2FyY2gveDg2L3hlbi94ZW4tcHZoLlMgYi9hcmNoL3g4Ni94ZW4veGVuLXB2aC5TCj4gaW5k
ZXggY2EyZDNiMmJmMmFmLi44MmJhODliYThiYjMgMTAwNjQ0Cj4gLS0tIGEvYXJjaC94ODYveGVu
L3hlbi1wdmguUwo+ICsrKyBiL2FyY2gveDg2L3hlbi94ZW4tcHZoLlMKPiBAQCAtMTE0LDggKzEx
NCw4IEBAIEVOVFJZKHB2aF9zdGFydF94ZW4pCj4gIAljYWxsIHhlbl9wcmVwYXJlX3B2aAo+ICAK
PiAgCS8qIHN0YXJ0dXBfNjQgZXhwZWN0cyBib290X3BhcmFtcyBpbiAlcnNpLiAqLwo+IC0JbW92
ICRfcGEocHZoX2Jvb3RwYXJhbXMpLCAlcnNpCj4gLQltb3YgJF9wYShzdGFydHVwXzY0KSwgJXJh
eAo+ICsJbW92YWJzICRfcGEocHZoX2Jvb3RwYXJhbXMpLCAlcnNpCj4gKwltb3ZhYnMgJF9wYShz
dGFydHVwXzY0KSwgJXJheAo+ICAJam1wIColcmF4Cj4gIAo+ICAjZWxzZSAvKiBDT05GSUdfWDg2
XzY0ICovCj4gQEAgLTE2MSwxMCArMTYxLDE1IEBAIEVORChwdmhfc3RhcnRfeGVuKQo+ICAKPiAg
CS5zZWN0aW9uICIuaW5pdC5kYXRhIiwiYXciCj4gIAkuYmFsaWduIDgKPiArCS8qCj4gKwkgKiBV
c2UgYSBxdWFkIGZvciBfcGEoZ2R0X3N0YXJ0KSBiZWNhdXNlIFBJRSBkb2VzIG5vdCB1bmRlcnN0
YW5kIGEKPiArCSAqIGxvbmcgaXMgZW5vdWdoLiBUaGUgcmVzdWx0aW5nIHZhbHVlIHdpbGwgc3Rp
bGwgYmUgaW4gdGhlIGxvd2VyIGxvbmcKPiArCSAqIHBhcnQuCj4gKwkgKi8KPiAgZ2R0Ogo+ICAJ
LndvcmQgZ2R0X2VuZCAtIGdkdF9zdGFydAo+IC0JLmxvbmcgX3BhKGdkdF9zdGFydCkKPiAtCS53
b3JkIDAKPiArCS5xdWFkIF9wYShnZHRfc3RhcnQpCgoKV2l0aCB0aGlzIGJlY29taW5nIC5xdWFk
IDMyLWJpdCBjb21waWxhdGlvbiBmYWlsczoKCi9kYXRhL3Jvb3QvbGludXgvYXJjaC94ODYveGVu
L3hlbi1wdmguUzogQXNzZW1ibGVyIG1lc3NhZ2VzOgovZGF0YS9yb290L2xpbnV4L2FyY2gveDg2
L3hlbi94ZW4tcHZoLlM6MTQ3OiBFcnJvcjogY2Fubm90IHJlcHJlc2VudApyZWxvY2F0aW9uIHR5
cGUgQkZEX1JFTE9DXzY0CgoKLWJvcmlzCgoKPiArCS5iYWxpZ24gOAo+ICBnZHRfc3RhcnQ6Cj4g
IAkucXVhZCAweDAwMDAwMDAwMDAwMDAwMDAgICAgICAgICAgICAvKiBOVUxMIGRlc2NyaXB0b3Ig
Ki8KPiAgI2lmZGVmIENPTkZJR19YODZfNjQKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0
cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlz
dGluZm8veGVuLWRldmVs
