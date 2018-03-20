From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/3] x86/pv: Minor tweaks to {,
 compat_}register_guest_callback()
Date: Tue, 20 Mar 2018 04:06:05 -0600
Message-ID: <5AB0EB1D02000078001B3DA2@prv-mh.provo.novell.com>
References: <1521115122-15824-1-git-send-email-andrew.cooper3@citrix.com>
 <1521115122-15824-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1521115122-15824-4-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, =?UTF-8?Q?Roger=20Pau=20Monn=C3=A9?= <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjAzLjE4IGF0IDEyOjU4LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gLS0tIGEveGVuL2FyY2gveDg2L3B2L2NhbGxiYWNrLmMKPiArKysgYi94ZW4vYXJjaC94
ODYvcHYvY2FsbGJhY2suYwo+IEBAIC03MSwxMCArNzEsMTEgQEAgc3RhdGljIHZvaWQgdW5yZWdp
c3Rlcl9ndWVzdF9ubWlfY2FsbGJhY2sodm9pZCkKPiAgICAgIG1lbXNldCh0LCAwLCBzaXplb2Yo
KnQpKTsKPiAgfQo+ICAKPiAtc3RhdGljIGxvbmcgcmVnaXN0ZXJfZ3Vlc3RfY2FsbGJhY2soc3Ry
dWN0IGNhbGxiYWNrX3JlZ2lzdGVyICpyZWcpCj4gK3N0YXRpYyBpbnQgcmVnaXN0ZXJfZ3Vlc3Rf
Y2FsbGJhY2soc3RydWN0IGNhbGxiYWNrX3JlZ2lzdGVyICpyZWcpCj4gIHsKPiAtICAgIGxvbmcg
cmV0ID0gMDsKPiAgICAgIHN0cnVjdCB2Y3B1ICpjdXJyID0gY3VycmVudDsKPiArICAgIHN0cnVj
dCBwdl92Y3B1ICpwdiA9ICZjdXJyLT5hcmNoLnB2X3ZjcHU7Cj4gKyAgICBpbnQgcmV0ID0gMDsK
Ckluc3RlYWQgb2YgYWx0ZXJpbmcgcmV0J3MgdHlwZSwgd2h5IGRvbid0IHlvdSBkcm9wIGl0IGFs
dG9nZXRoZXI/ClNhbWUgYWN0dWFsbHkgZm9yIHRoZSB1bnJlZ2lzdGVyIGZ1bmN0aW9uIGluIHBh
dGNoIDIuIFByZWZlcmFibHkKd2l0aCB0aGF0IGRvbmUKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNo
IDxqYmV1bGljaEBzdXNlLmNvbT4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0
aW5mby94ZW4tZGV2ZWw=
