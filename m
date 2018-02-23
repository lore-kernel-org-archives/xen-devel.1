From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v4 13/16] xen/grant: Switch {create,
 replace}_grant_p2m_mapping to typesafe MFN
Date: Fri, 23 Feb 2018 17:29:50 +0000
Message-ID: <20180223172950.4kxm2klgm6uxfyqx@citrix.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-14-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <20180221140259.29360-14-julien.grall@arm.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>
Cc: Tim Deegan <tim@xen.org>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, xen-devel@lists.xen.org, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBGZWIgMjEsIDIwMTggYXQgMDI6MDI6NTZQTSArMDAwMCwgSnVsaWVuIEdyYWxsIHdy
b3RlOgo+IFRoZSBjdXJyZW50IHByb3RvdHlwZSBpcyBzbGlnaHRseSBjb25mdXNpbmcgYmVjYXVz
ZSBpdCB0YWtlcyBhIGd1ZXN0Cj4gcGh5c2ljYWwgYWRkcmVzcyBhbmQgYSBtYWNoaW5lIHBoeXNp
Y2FsIGZyYW1lIChub3QgYWRkcmVzcyEpLiBTd2l0Y2hpbmcgdG8KPiBNRk4gd2lsbCBpbXByb3Zl
IHNhZmV0eSBhbmQgcmVkdWNlIHRoZSBjaGFuY2UgdG8gbWlzdGFrZW5seSBpbnZlcnQgdGhlCj4g
MiBwYXJhbWV0ZXJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1bGllbiBncmFsbCA8anVsaWVuLmdy
YWxsQGFybS5jb20+Cj4gCgpSZXZpZXdlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1k
ZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8v
bGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
