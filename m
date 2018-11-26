From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH] x86emul: fix test harness 32-bit "clean"
 target handling
Date: Mon, 26 Nov 2018 14:24:00 +0000
Message-ID: <20181126142359.o4dk3mjojpsfak6j@zion.uk.xensource.com>
References: <5BFBFF8D020000780020006B@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=v668=of=citrix.com=prvs=861c38f28=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gRHnw-0004wh-CE
 for xen-devel@lists.xenproject.org; Mon, 26 Nov 2018 14:24:04 +0000
Content-Disposition: inline
In-Reply-To: <5BFBFF8D020000780020006B@prv1-mh.provo.novell.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: xen-devel <xen-devel@lists.xenproject.org>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gTW9uLCBOb3YgMjYsIDIwMTggYXQgMDc6MTM6MzNBTSAtMDcwMCwgSmFuIEJldWxpY2ggd3Jv
dGU6Cj4gV2hlbiBwcmVwYXJpbmcgd2hhdCBpcyBub3cgNTJjMzdmN2FiOSAoIng4NmVtdWw6IGFs
c28gYWxsb3cgcnVubmluZyB0aGUKPiAzMi1iaXQgaGFybmVzcyBvbiBhIDY0LWJpdCBkaXN0cm8i
KSBJIGZpcnN0IHdyb25nbHkgdXNlZCBYRU5fVEFSR0VUX0FSQ0gKPiBpbnN0ZWFkIG9mIFhFTl9D
T01QSUxFX0FSQ0guIFdoZW4gcmVhbGl6aW5nIHRoZSBtaXN0YWtlIEkgZm9yZ290IHRvIGFsc28K
PiBzd2l0Y2ggYXJvdW5kIHRoZSB1c2UgaW4gdGhlIGV4cHJlc3Npb24gY29udHJvbGxpbmcgdGhl
IHJ1bGUKPiBkZXBlbmRlbmNpZXMsIGNhdXNpbmcgIm1ha2UgZGlzdGNsZWFuIiB0byBmYWlsIG9u
IDY0LWJpdCBkaXN0cm9zLgo+IAo+IFJlcG9ydGVkLWJ5OiBQYXVsIER1cnJhbnQgPFBhdWwuRHVy
cmFudEBjaXRyaXguY29tPgo+IFNpZ25lZC1vZmYtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KPiBUZXN0ZWQtYnk6IFBhdWwgRHVycmFudCA8UGF1bC5EdXJyYW50QGNpdHJpeC5j
b20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxp
c3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVj
dC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
