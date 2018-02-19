From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH RFC] CODING_STYLE: document intended usage
	of types
Date: Mon, 19 Feb 2018 08:11:09 -0700
Message-ID: <5A8AF71D02000078001A9257@prv-mh.provo.novell.com>
References: <5A8A9C9902000078001A8E64@prv-mh.provo.novell.com>
 <23178.47404.429603.605322@mariner.uk.xensource.com>
 <5A8AD7D502000078001A901D@prv-mh.provo.novell.com>
 <23178.54186.6211.440304@mariner.uk.xensource.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=udnn=fn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1enn69-0005s8-0j
 for xen-devel@lists.xenproject.org; Mon, 19 Feb 2018 15:11:21 +0000
In-Reply-To: <23178.54186.6211.440304@mariner.uk.xensource.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Ian Jackson <ian.jackson@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE5LjAyLjE4IGF0IDE0OjM5LCA8aWFuLmphY2tzb25AY2l0cml4LmNvbT4gd3JvdGU6
Cj4gSmFuIEJldWxpY2ggd3JpdGVzICgiUmU6IFtQQVRDSCBSRkNdIENPRElOR19TVFlMRTogZG9j
dW1lbnQgaW50ZW5kZWQgdXNhZ2Ugb2YgCj4gdHlwZXMiKToKPj4gVHlwZXMgdG8gYmUgdXNlZCBm
b3IgYWRkcmVzc2VzIC0gZnJvbSBhIHJlYWxseSBnZW5lcmljIHBvdiAtCj4+IGRlcGVuZCBvbiB0
aGUgYXJjaGl0ZWN0dXJlLiBJaXJjIHRoZXJlIGFyZSBzb21lIHdoZXJlIGEgc2lnbmVkCj4+IHR5
cGUgaXMgdGhlIG1vcmUgbmF0dXJhbCByZXByZXNlbnRhdGlvbiwgd2hpbGUgb24geDg2IGFuZCBB
Uk0KPj4gd2UnZCBjZXJ0YWlubHkgdXNlICJ1bnNpZ25lZCBsb25nIi4gU2luY2UgZ3Vlc3RzIG1h
eSBiZSBvZgo+PiBkaWZmZXJlbnQgYml0bmVzcywgc3BlY2lmeWluZyB3aGF0IHR5cGUgdG8gdXNl
IGZvciB0aGVpciBhZGRyZXNzZXMKPj4gd291bGQgZ28gdG9vIGZhciBhbnl3YXkgaW1vLgo+IAo+
IElmIHRoZSB1bmRlcmx5aW5nIEMgdHlwZSBkZXBlbmRzIG9uIHRoZSBhcmNoaXRlY3R1cmUsIHRo
ZW4gdGhlIGNvZGUKPiBzaG91bGQgdXNlIGEgc3VpdGFibGUgdHlwZWRlZi4gIEluIGdlbmVyaWMg
Y29kZSB0aGlzIG1lYW5zIHRoYXQgdGhlCj4gY29kZSBpcyBwb3J0YWJsZSBhbmQgY29ycmVjdDsg
aW4gYXJjaC1zcGVjaWZpYyBjb2RlIGl0IG1lYW5zIGl0J3MKPiBjb25zaXN0ZW50IHdpdGggdGhl
IGdlbmVyaWMgY29kZS4KCldlbGwsIGZvciB0aGUgc3BlY2lmaWMgZXhhbXBsZSB0aGVyZSBpcyB1
aW50cHRyX3QsIGJ1dCB0aGUgTGludXgKd29ybGQgYXBwZWFycyB0byBkaXNsaWtlIGl0IChhbmQg
d2UncmUgc29ydCBvZiBmb2xsb3dpbmcgc3VpdCkuIEhlbmNlCmZvciB0aGUgZm9yZXNlZWFibGUg
ZnV0dXJlIGl0J2xsIGNvbnRpbnVlIHRvIGJlIHVuc2lnbmVkIGxvbmcuCgpKYW4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
