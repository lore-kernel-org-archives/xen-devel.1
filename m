From: Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: [PATCH v2 2/6] x86emul: extend MASKMOV{Q, DQU} tests
Date: Mon, 3 Sep 2018 17:44:15 +0100
Message-ID: <3d4ccbf5-2633-2b66-3bb2-855d722dad6a@citrix.com>
References: <5B6BF83602000078001DC548@prv1-mh.provo.novell.com>
 <5B86AB9002000078001E31E3@prv1-mh.provo.novell.com>
 <5B86AC6E02000078001E31F0@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=wisl=lr=citrix.com=prvs=7772440c6=andrew.cooper3@srs-us1.protection.inumbo.net>)
 id 1fwrxa-0004MB-3N
 for xen-devel@lists.xenproject.org; Mon, 03 Sep 2018 16:44:18 +0000
In-Reply-To: <5B86AC6E02000078001E31F0@prv1-mh.provo.novell.com>
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
List-Id: xen-devel@lists.xenproject.org

T24gMjkvMDgvMTggMTU6MjMsIEphbiBCZXVsaWNoIHdyb3RlOgo+IFdoaWxlIGRlcml2aW5nIHRo
ZSBmaXJzdCBBVlg1MTIgcGllY2VzIGZyb20gZXhpc3RpbmcgY29kZSBJJ3ZlIGdvdCB0aGUKPiAo
aW4gdGhlIGVuZCB3cm9uZykgaW1wcmVzc2lvbiB0aGF0IHRoZSBlbXVsYXRpb24gb2YgdGhlc2Ug
aW5zbnMgd291bGQgYmUKPiBicm9rZW4uIEJlc2lkZXMgdGVzdGluZyB0aGF0IHRoZSBpbnN0cnVj
dGlvbnMgYWN0IGFzIG5vLW9wcyB3aGVuIHRoZQo+IGNvbnRyb2xsaW5nIG1hc2sgYml0cyBhcmUg
YWxsIHplcm8sIGFkZCBvbmVzIHRvIGFsc28gY2hlY2sgdGhhdCB0aGUgZGF0YQo+IG1lcmdpbmcg
YWN0dWFsbHkgd29ya3MuCj4KPiBTaWduZWQtb2ZmLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hA
c3VzZS5jb20+CgpBY2tlZC1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
