From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v8 12/50] x86emul: support AVX512{BW,
 DQ} mask move insns
Date: Fri, 17 May 2019 18:02:17 +0100
Message-ID: <cc175d9f-5276-bb4e-78cb-3a3e32c3b66f@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5C8B7EC0020000780021F10B@prv1-mh.provo.novell.com>
 <5C8B81D3020000780021F16D@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <SRS0=gdXm=TR=citrix.com=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1hRgFU-0006jl-4I
 for xen-devel@lists.xenproject.org; Fri, 17 May 2019 17:02:24 +0000
In-Reply-To: <5C8B81D3020000780021F16D@prv1-mh.provo.novell.com>
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
Cc: George Dunlap <George.Dunlap@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gMTUvMDMvMjAxOSAxMDo0MywgSmFuIEJldWxpY2ggd3JvdGU6Cj4gRW50cmllcyB0byB0aGUg
dGFibGVzIGluIGV2ZXgtZGlzcDguYyBhcmUgYWRkZWQgZGVzcGl0ZSB0aGVzZSBpbnNucyBub3QK
PiBhbGxvd2luZyBmb3IgbWVtb3J5IG9wZXJhbmRzLCB3aXRoIHRoZSBnb2FsIG9mIHRoZSB0YWJs
ZXMgZ2l2aW5nIGEKPiBjb21wbGV0ZSBwaWN0dXJlIG9mIHRoZSBzdXBwb3J0ZWQgRVZFWC1lbmNv
ZGVkIGluc25zIGluIHRoZSBlbmQuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJl
dWxpY2hAc3VzZS5jb20+CgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNA
Y2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
