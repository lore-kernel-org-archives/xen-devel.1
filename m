From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/2] tools/libxc: Fix error handling in
 get_cpuid_domain_info()
Date: Fri, 30 Nov 2018 02:23:39 -0700
Message-ID: <5C01019B02000078002017DE@prv1-mh.provo.novell.com>
References: <1543519202-14603-1-git-send-email-andrew.cooper3@citrix.com>
 <1543519202-14603-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1543519202-14603-3-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Ian Jackson <Ian.Jackson@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Sergey Dyasli <sergey.dyasli@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI5LjExLjE4IGF0IDIwOjIwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gZ2V0X2NwdWlkX2RvbWFpbl9pbmZvKCkgaGFzIHR3byBjb25mbGljdGluZyByZXR1cm4g
c3R5bGVzIC0gZWl0aGVyIC1lcnJvciBmb3IKPiBsb2NhbCBmYWlsdXJlcywgb3IgLTEvZXJybm8g
Zm9yIGh5cGVyY2FsbCBmYWlsdXJlcy4gIFN3aXRjaCB0byBjb25zaXN0ZW50bHkKPiB1c2UgLWVy
cm9yLgo+IAo+IFdoaWxlIGZpeGluZyB0aGUgeGNfZ2V0X2NwdV9mZWF0dXJlc2V0KCksIHRha2Ug
dGhlIG9wcG9ydHVuaXR5IHRvIHJlbW92ZSB0aGUKPiByZWR1bmRhbmN5IGFuZCBtb3ZlIGl0IHRv
IGJlIGFkamFjZW50IHRvIHRoZSBvdGhlciBmZWF0dXJlc2V0IGhhbmRsaW5nLgoKSGF2aW5nIG5v
dGljZWQgdGhlIHJlZHVuZGFuY3kgYmVmb3JlLCBJIHdhcyBhc3N1bWluZyB0aGlzIHdhcyBkb25l
CnRvIHByZXZlbnQgYWx0ZXJpbmcgaG9zdF9ucl9mZWF0dXJlcyBlYXJseSwganVzdCBpbiBjYXNl
IGZ1dHVyZSBjb2RlCmFkZGl0aW9ucyB3b3VsZCB3YW50IHRvIHVzZSBpdHMgb3JpZ2luYWwgdmFs
dWUuIFRoZSB3YXkgaXQgaXMgbm93LCB0aGUKY29kZSBmb2xkaW5nIGxvb2tzIGNvcnJlY3QuCgo+
IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+
CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGlu
ZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnBy
b2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
