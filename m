From: Anthony PERARD <anthony.perard@citrix.com>
Subject: Re: [PATCH v3 3/4] libxl: add libxl_get_parameters()
 function
Date: Mon, 13 May 2019 10:51:37 +0100
Message-ID: <20190513095136.GA15831@perard.uk.xensource.com>
References: <20190509154128.9196-1-vliaskovitis@suse.com>
 <20190509154128.9196-4-vliaskovitis@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=LC6n=TN=citrix.com=prvs=029733b21=anthony.perard@srs-us1.protection.inumbo.net>)
 id 1hQ7cn-0000yG-70
 for xen-devel@lists.xenproject.org; Mon, 13 May 2019 09:52:01 +0000
Content-Disposition: inline
In-Reply-To: <20190509154128.9196-4-vliaskovitis@suse.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Vasilis Liaskovitis <vliaskovitis@suse.com>
Cc: jgross@suse.com, sstabellini@kernel.org, wei.liu2@citrix.com, George.Dunlap@eu.citrix.com, andrew.cooper3@citrix.com, ian.jackson@eu.citrix.com, tim@xen.org, jbeulich@suse.com, xen-devel@lists.xenproject.org, dgdegra@tycho.nsa.gov
List-Id: xen-devel@lists.xenproject.org

T24gVGh1LCBNYXkgMDksIDIwMTkgYXQgMDU6NDE6MjdQTSArMDIwMCwgVmFzaWxpcyBMaWFza292
aXRpcyB3cm90ZToKPiBkaWZmIC0tZ2l0IGEvdG9vbHMvbGlieGwvbGlieGwuYyBiL3Rvb2xzL2xp
YnhsL2xpYnhsLmMKPiBpbmRleCBlYzcxNTc0ZTk5Li4xMjQwMzNlNWEzIDEwMDY0NAo+IC0tLSBh
L3Rvb2xzL2xpYnhsL2xpYnhsLmMKPiArKysgYi90b29scy9saWJ4bC9saWJ4bC5jCj4gQEAgLTY2
OSw2ICs2NjksMjEgQEAgaW50IGxpYnhsX3NldF9wYXJhbWV0ZXJzKGxpYnhsX2N0eCAqY3R4LCBj
aGFyICpwYXJhbXMpCj4gICAgICByZXR1cm4gMDsKPiAgfQo+ICAKPiAraW50IGxpYnhsX2dldF9w
YXJhbWV0ZXJzKGxpYnhsX2N0eCAqY3R4LCBjaGFyICpwYXJhbXMsIGNoYXIgKnZhbHVlcykKPiAr
ewo+ICsgICAgaW50IHJldDsKPiArICAgIEdDX0lOSVQoY3R4KTsKPiArCj4gKyAgICByZXQgPSB4
Y19nZXRfcGFyYW1ldGVycyhjdHgtPnhjaCwgcGFyYW1zLCB2YWx1ZXMpOwoKUGxlYXNlIG5hbWUg
dGhlIHZhcmlhYmxlIGByJyBpbnN0ZWFkIG9mICdyZXQnLiBTZWUgQ09ESU5HX1NUWUxFIGFzIGZv
cgp3aHkuCgo+ICsgICAgaWYgKHJldCA8IDApIHsKPiArICAgICAgICBMT0dFVihFUlJPUiwgcmV0
LCAiZ2V0dGluZyBwYXJhbWV0ZXJzIik7CgpMT0dFViB0YWtlcyBgZXJybm8nIGFzIHNlY29uZCBw
YXJhbWV0ZXIsIHRoZSB2YWx1ZSBvZiBgcmV0JyBzZWVtcyB0byBiZQotMSBvciAwLCBhbmQgeGNf
Z2V0X3BhcmFtZXRlcnMgc2hvdWxkIHNldCBgZXJybm8nLiAgU28sIHVzaW5nIHRoZSBtYWNybwpM
T0dFKCkgc2hvdWxkIGJlIGVub3VnaC4KCj4gKyAgICAgICAgR0NfRlJFRTsKPiArICAgICAgICBy
ZXR1cm4gcmV0Oy8vRVJST1JfRkFJTDsKCkFsbW9zdCEgSSB0aGluayBFUlJPUl9GQUlMIHNob3Vs
ZCBiZSByZXR1cm5lZCBoZXJlLCBub3QgYSByZXR1cm4gdmFsdWUKZnJvbSBhIGxpYnhjIGNhbGwu
Cgo+ICsgICAgfQo+ICsgICAgR0NfRlJFRTsKPiArICAgIHJldHVybiAwOwoKSW5zdGVhZCBvZiBo
YXZpbmcgdG8gd3JpdGUgR0NfRlJFRSB0d2ljZSwgeW91IGNvdWxkOgoKICAgIGlmIChyIDwgMCkg
ewogICAgICAgTE9HLi4uCiAgICAgICByYyA9IEVSUk9SX0ZBSUw7CiAgICAgICBnb3RvIG91dDsK
ICAgIH0KICAgIHJjPTA7CiAgb3V0OgogICAgR0NfRlJFRTsKICAgIHJldHVybiByYzsKCj4gK30K
PiArCgpUaGFua3MsCgotLSAKQW50aG9ueSBQRVJBUkQKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
