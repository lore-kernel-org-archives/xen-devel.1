From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/3] xen: drop preempt_count() for non-debug
 builds
Date: Wed, 22 May 2019 04:18:21 -0600
Message-ID: <5CE521ED02000078002314AA@prv1-mh.provo.novell.com>
References: <20190522094549.28397-1-jgross@suse.com>
 <20190522094549.28397-3-jgross@suse.com>
 <34f128f9-190d-fdf7-0082-204ab9ccb31a@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=3DNt=TW=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1hTOKH-0001WU-4R
 for xen-devel@lists.xenproject.org; Wed, 22 May 2019 10:18:25 +0000
In-Reply-To: <34f128f9-190d-fdf7-0082-204ab9ccb31a@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIyLjA1LjE5IGF0IDEyOjAwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gT24gMjIvMDUvMjAxOSAxMDo0NSwgSnVlcmdlbiBHcm9zcyB3cm90ZToKPj4gcHJlZW1w
dF9jb3VudCgpIGFuZCB0aGUgYXNzb2NpYXRlZCBwZXItY3B1IHZhcmlhYmxlIF9fcHJlZW1wdF9j
b3VudAo+PiBhcmUgdGVzdGVkIGluIGRlYnVnIGJ1aWxkIG9ubHkuIFNvIGRyb3AgdGhlbSBmb3Ig
bm9uLWRlYnVnIGJ1aWxkcy4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSnVlcmdlbiBHcm9zcyA8amdy
b3NzQHN1c2UuY29tPgo+IAo+IEknZCBiZSB0ZW1wdGVkIHRvIGZvbGQgcGF0Y2hlcyAyIGFuZCAz
IHRvZ2V0aGVyLCBiZWNhdXNlIHRoZXkgYXJlIGJvdGgKPiB0aGUgc2FtZSBjaGFuZ2UsIGFuZCBp
dCB3b3VsZCByZWR1Y2UgdGhlIGNodXJuLgo+IAo+IFJldmlld2VkLWJ5OiBBbmRyZXcgQ29vcGVy
IDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiwgaWRlYWxseSB3aXRoIHRoZQo+IHR3byBmb2xk
ZWQgaW50byBvbmUuCgpJJ20gYSBsaXR0bGUgc3VycHJpc2VkIGJ5IHRoaXM6IFdhc24ndCBpdCB5
b3Ugd2hvIGdlbmVyYWxseQp3YW50ZWQgd2hhdCBBU1NFUlQoKSBleHBhbmRzIHRvIChjb250cm9s
bGVkIGJ5IE5ERUJVRykKYmUgaW5kZXBlbmRlbnQgb2YgQ09ORklHX0RFQlVHLCBhdCBzb21lIHBv
aW50IGRvd24KdGhlIHJvYWQ/IEFyZW4ndCB5b3UgZXZlbiBoYXZpbmcgQVNTRVJUKClzIGVuYWJs
ZWQgaW4KcmVsZWFzZSBidWlsZHMgb2YgWGVuU2VydmVyLCBvciBhbSBJIG1pc3JlbWVtYmVyaW5n
PyBJZiBzbwpwYXRjaCAzIHdvdWxkIG1vdmUgdXMgaW4gdGhlIHdyb25nIGRpcmVjdGlvbi4KCkph
bgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4t
ZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczov
L2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
