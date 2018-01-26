From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v11 6/11] x86/entry: Organise the clobbering
 of the RSB/RAS on entry to Xen
Date: Fri, 26 Jan 2018 05:17:59 -0700
Message-ID: <5A6B2A8702000078001A2BEF@prv-mh.provo.novell.com>
References: <1516799535-5778-7-git-send-email-andrew.cooper3@citrix.com>
 <1516899276-28729-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1516899276-28729-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjAxLjE4IGF0IDE3OjU0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gcmV0IGluc3RydWN0aW9ucyBhcmUgc3BlY3VsYXRlZCBkaXJlY3RseSB0byB2YWx1ZXMg
cmVjb3JkZWQgaW4gdGhlIFJldHVybgo+IFN0YWNrIEJ1ZmZlci9SZXR1cm4gQWRkcmVzcyBTdGFj
aywgYXMgdGhlcmUgaXMgbm8gdW5jZXJ0YWludHkgaW4gd2VsbC1mb3JtZWQKPiBjb2RlLiAgR3Vl
c3RzIGNhbiB0YWtlIGFkdmFudGFnZSBvZiB0aGlzIGluIHR3byB3YXlzOgo+IAo+ICAgMSkgSWYg
dGhleSBjYW4gZmluZCBhIHBhdGggaW4gWGVuIHdoaWNoIGV4ZWN1dGVzIG1vcmUgcmV0IGluc3Ry
dWN0aW9ucyB0aGFuCj4gICAgICBjYWxsIGluc3RydWN0aW9ucy4gIChBdCBsZWFzdCBvbmUgaW4g
dGhlIHdhaXRxdWV1ZSBpbmZyYXN0cnVjdHVyZSwKPiAgICAgIHByb2JhYmx5IG90aGVycy4pCj4g
Cj4gICAyKSBVc2UgdGhlIGZhY3QgdGhhdCB0aGUgUlNCL1JBUyBpbiBoYXJkd2FyZSBpcyBhY3R1
YWxseSBhIGNpcmN1bGFyIHN0YWNrCj4gICAgICB3aXRob3V0IGEgY29uY2VwdCBvZiBlbXB0eS4g
IChXaGVuIGl0IGxvZ2ljYWxseSBlbXB0aWVzLCBzdGFsZSB2YWx1ZXMKPiAgICAgIHdpbGwgc3Rh
cnQgYmVpbmcgdXNlZC4pCj4gCj4gVG8gbWl0aWdhdGUsIG92ZXJ3cml0ZSB0aGUgUlNCIG9uIGVu
dHJ5IHRvIFhlbiB3aXRoIGdhZGdldHMgd2hpY2ggd2lsbCBjYXB0dXJlCj4gYW5kIGNvbnRhaW4g
cm9ndWUgc3BlY3VsYXRpb24uCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5k
cmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxp
Y2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
