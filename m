From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [RFC Patch v4 3/8] xl/acpi: unify the computation
	of lapic_id
Date: Thu, 22 Feb 2018 18:05:48 +0000
Message-ID: <20180222180547.hrkqn6zw7yae77pw@citrix.com>
References: <1512546614-9937-1-git-send-email-chao.gao@intel.com>
 <1512546614-9937-4-git-send-email-chao.gao@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Content-Disposition: inline
In-Reply-To: <1512546614-9937-4-git-send-email-chao.gao@intel.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Chao Gao <chao.gao@intel.com>
Cc: Ian Jackson <ian.jackson@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xen.org
List-Id: xen-devel@lists.xenproject.org

T24gV2VkLCBEZWMgMDYsIDIwMTcgYXQgMDM6NTA6MDlQTSArMDgwMCwgQ2hhbyBHYW8gd3JvdGU6
Cj4gVGhlcmUgd2VyZSB0d28gcGxhY2VzIHdoZXJlIHRoZSBsYXBpY19pZCBpcyBjb21wdXRlZCwg
b25lIGluIGh2bWxvYWRlciBhbmQgb25lCj4gaW4gbGliYWNwaS4gVW5pZnkgdGhlbSBieSBkZWZp
bmluZyBMQVBJQ19JRCBpbiBhIGhlYWRlciBmaWxlIGFuZCBpbmNsdWluZyBpdAo+IGluIGJvdGgg
cGxhY2VzLgo+IAo+IFRvIGFkZHJlc3MgY29tcGlsYXRpb24gaXNzdWUgYW5kIG1ha2UgbGliYWNw
aS5oIHNlbGYtY29udGFpbmVkLCBpbmNsdWRlCj4gc3RkaW50LmggaW4gbGliYWNwaS5oLgo+IAo+
IFNpZ25lZC1vZmYtYnk6IENoYW8gR2FvIDxjaGFvLmdhb0BpbnRlbC5jb20+CgpSZXZpZXdlZC1i
eTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVs
QGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1h
bi9saXN0aW5mby94ZW4tZGV2ZWw=
