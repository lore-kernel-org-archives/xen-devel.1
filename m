From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH 2/7] common: avoid atomic read-modify-write
 accesses in map_vcpu_info()
Date: Mon, 11 Mar 2019 16:50:51 +0000
Message-ID: <ff56f677-a300-a769-a021-b36192d47c3a@citrix.com>
References: <5C869060020000780021D5D4@prv1-mh.provo.novell.com>
 <5C86916A020000780021D5F4@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=qj7e=RO=citrix.com=prvs=9661cd40b=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1h3O8f-00022F-V0
 for xen-devel@lists.xenproject.org; Mon, 11 Mar 2019 16:50:57 +0000
In-Reply-To: <5C86916A020000780021D5F4@prv1-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>, xen-devel <xen-devel@lists.xenproject.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Tim Deegan <tim@xen.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, Julien Grall <julien.grall@arm.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTEvMDMvMjAxOSAxNjo0OCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4gVGhlcmUncyBubyBuZWVk
IHRvIHNldCB0aGUgZXZ0Y2huX3BlbmRpbmdfc2VsIGJpdHMgb25lIGJ5IG9uZS4gU2ltcGx5Cj4g
d3JpdGUgZnVsbCB3b3JkcyB3aXRoIGFsbCBvbmVzLgo+Cj4gRm9yIEFybSB0aGlzIHJlcXVpcmVz
IGV4dGVuZGluZyB3cml0ZV9hdG9taWMoKSB0byBhbHNvIGhhbmRsZSA2NC1iaXQKPiB2YWx1ZXM7
IGZvciBzeW1tZXRyeSByZWFkX2F0b21pYygpIGdldHMgYWRqdXN0ZWQgYXMgd2VsbC4KPgo+IFNp
Z25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4KClJldmlld2VkLWJ5
OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPgoKKEknbGwgbGVhdmUg
dGhlIEFSTSBhc3NlbWJseSB0byBKdWxpZW4gdG8gY2hlY2sgb3ZlcikKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QK
WGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5v
cmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
