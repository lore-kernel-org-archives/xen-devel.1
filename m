From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 11/17] x86: Protect unaware domains from
 meddling hyperthreads
Date: Wed, 17 Jan 2018 08:43:47 +0000
Message-ID: <0bceaf8f-fe62-a98e-dd7b-41a1f7e7d253@citrix.com>
References: <1515780067-31735-1-git-send-email-andrew.cooper3@citrix.com>
 <1515780067-31735-12-git-send-email-andrew.cooper3@citrix.com>
 <5A5C9DF5020000780019EBCA@prv-mh.provo.novell.com>
 <fd4555a3-ec19-e282-7a3a-51e47b0f6479@citrix.com>
 <5A5F1A28020000780019F593@prv-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <5A5F1A28020000780019F593@prv-mh.provo.novell.com>
Content-Language: en-GB
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

T24gMTcvMDEvMjAxOCAwODo0MCwgSmFuIEJldWxpY2ggd3JvdGU6Cj4+Pj4gT24gMTYuMDEuMTgg
YXQgMjI6MTEsIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPiB3cm90ZToKPj4gQW4gYWx0ZXJu
YXRpdmUgdG8gdGhlIGN1cnJlbnQgbGV2ZWxsaW5nIGxvZ2ljIHdvdWxkIGJlIHRvIHRyZWF0IFNU
SUJQIGFzCj4+IGEgU3BlY2lhbCBCaXQgKGluIENQVUlEIHRlcm1zLCBsaWtlIE9TWFNBVkUvZXRj
KSBhbmQgdW5jb25kaXRpb25hbGx5IHNldAo+PiBpdCBlcXVhbCB0byBJQlJTLCBpcnJlc3BlY3Rp
dmUgb2YgdGhlIHRvb2xzdGFjayBzZXR0aW5nLiAgVGhhdCB3YXksCj4+IG1pZ3JhdGlvbiBiZXR3
ZWVuIEhUIGFuZCBub24tSFQgaGFyZHdhcmUgaXMgc2FmZSBhbmQgYSBWTSB3aGljaCBjaG9vc2Vz
Cj4+IHRvIHVzZSBTVElCUCB3aWxsIHdvcmsgZXZlbiBvbiBub24tSFQgaGFyZHdhcmUgd2hpY2gg
c2ltcGx5IGlnbm9yZXMgdGhlCj4+IHJlcXVlc3QuCj4gV291bGRuJ3QgdGhhdCBvdmVyYWxsIHJl
c3VsdCBpbiBzaW1wbGVyIGNvZGUgYW55d2F5PwoKTXVjaCwgZXhjZXB0IGl0cyBvbmx5IGJlY29t
ZSBhbiBvcHRpb24gc2luY2UgeWVzdGVyZGF5LgoKfkFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
