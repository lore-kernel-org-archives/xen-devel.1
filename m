From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 1/5] x86/entry: Correct comparisons
 against boolean variables
Date: Fri, 02 Mar 2018 09:27:53 -0700
Message-ID: <5A99899902000078001ADF92@prv-mh.provo.novell.com>
References: <1519743036-11600-1-git-send-email-andrew.cooper3@citrix.com>
 <1519743036-11600-2-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1519743036-11600-2-git-send-email-andrew.cooper3@citrix.com>
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

Pj4+IE9uIDI3LjAyLjE4IGF0IDE1OjUwLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhlIGNvcnJlY3Qgd2F5IHRvIGNoZWNrIGEgYm9vbGVhbiBpcyBgY21wYiAkMGAgb3Ig
YHRlc3RiICQweGZmYCwgd2hlcmVhcyBhCj4gbG90IG9mIG91ciBlbnRyeSBjb2RlIHVzZXMgYHRl
c3RiICQxYC4gIFRoaXMgd2lsbCB3b3JrIGluIHByaW5jaXBsZSBmb3IgdmFsdWVzCj4gd2hpY2gg
YXJlIHJlYWxseSBDIF9Cb29sIHR5cGVzLCBidXQgd29uJ3Qgd29yayBmb3Igb3RoZXIgaW50ZWdl
ciB0eXBlcyB3aGljaAo+IGFyZSBpbnRlbmRlZCB0byBoYXZlIGJvb2xlYW4gcHJvcGVydGllcy4K
PiAKPiBjbXAgaXMgdGhlIG1vcmUgbG9naWNhbCB3YXkgb2YgdGhpbmtpbmcgYWJvdXQgdGhlIG9w
ZXJhdGlvbiwgc28gYWRqdXN0IGFsbAo+IG91dHN0YW5kaW5nIHVzZXMgb2YgYHRlc3RiICQxYCBh
Z2FpbnN0IGJvb2xlYW4gdmFsdWVzLiAgQ2hhbmdpbmcgdGVzdCB0byBjbXAKPiBjaGFuZ2VzIHRo
ZSBsb2dpY2FsIG1uZW1vbmljIG9mIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uIGZyb20gJ3plcm8n
IHRvCj4gJ2VxdWFsJywgYnV0IHRoZSBhY3R1YWwgZW5jb2RpbmcgcmVtYWlucyB0aGUgc2FtZS4K
PiAKPiBObyBmdW5jdGlvbmFsIGNoYW5nZSwgYXMgYWxsIHVzZXMgYXJlIHJlYWwgQyBfQm9vbCB0
eXBlcywgYW5kIGNvbmZpcm1lZCBieQo+IGRpZmZpbmcgdGhlIGRpc2Fzc2VtYmx5Lgo+IAo+IFNp
Z25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpU
aGFua3MsIG9uZSBsZXNzIGl0ZW0gb24gdGhlIGxpc3Qgb2YgdGhpbmdzIEkga2VlcCBmb3JnZXR0
aW5nIHRvCmFjdHVhbGx5IGRvLgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBz
dXNlLmNvbT4KCkphbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qu
b3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2
ZWw=
