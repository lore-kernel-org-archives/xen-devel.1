From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v4 13/16] xen/grant: Switch {create,
 replace}_grant_p2m_mapping to typesafe MFN
Date: Fri, 02 Mar 2018 08:38:15 -0700
Message-ID: <5A997DF702000078001ADE93@prv-mh.provo.novell.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-14-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180221140259.29360-14-julien.grall@arm.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDIxLjAyLjE4IGF0IDE1OjAyLCA8anVsaWVuLmdyYWxsQGFybS5jb20+IHdyb3RlOgo+
IFRoZSBjdXJyZW50IHByb3RvdHlwZSBpcyBzbGlnaHRseSBjb25mdXNpbmcgYmVjYXVzZSBpdCB0
YWtlcyBhIGd1ZXN0Cj4gcGh5c2ljYWwgYWRkcmVzcyBhbmQgYSBtYWNoaW5lIHBoeXNpY2FsIGZy
YW1lIChub3QgYWRkcmVzcyEpLiBTd2l0Y2hpbmcgdG8KPiBNRk4gd2lsbCBpbXByb3ZlIHNhZmV0
eSBhbmQgcmVkdWNlIHRoZSBjaGFuY2UgdG8gbWlzdGFrZW5seSBpbnZlcnQgdGhlCj4gMiBwYXJh
bWV0ZXJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBncmFsbCA8anVsaWVuLmdyYWxsQGFy
bS5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwg
bWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3Rz
LnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
