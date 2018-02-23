From: "Tian, Kevin" <kevin.tian@intel.com>
Subject: Re: [PATCH v4 10/16] xen/mm: Switch map_pages_to_xen to
 use MFN typesafe
Date: Fri, 23 Feb 2018 04:59:17 +0000
Message-ID: <AADFC41AFE54684AB9EE6CBC0274A5D191015365@SHSMSX101.ccr.corp.intel.com>
References: <20180221140259.29360-1-julien.grall@arm.com>
 <20180221140259.29360-11-julien.grall@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <20180221140259.29360-11-julien.grall@arm.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Julien Grall <julien.grall@arm.com>, "xen-devel@lists.xen.org" <xen-devel@lists.xen.org>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>, Tim Deegan <tim@xen.org>, Jan Beulich <jbeulich@suse.com>, "Wang, Shane" <shane.wang@intel.com>, "Wei,
 Gang" <gang.wei@intel.com>
List-Id: xen-devel@lists.xenproject.org

PiBGcm9tOiBKdWxpZW4gR3JhbGwgW21haWx0bzpqdWxpZW4uZ3JhbGxAYXJtLmNvbV0KPiBTZW50
OiBXZWRuZXNkYXksIEZlYnJ1YXJ5IDIxLCAyMDE4IDEwOjAzIFBNCj4gCj4gVGhlIGN1cnJlbnQg
cHJvdG90eXBlIGlzIHNsaWdodGx5IGNvbmZ1c2luZyBiZWNhdXNlIGl0IHRha2VzIGEgdmlydHVh
bAo+IGFkZHJlc3MgYW5kIGEgcGh5c2ljYWwgZnJhbWUgKG5vdCBhZGRyZXNzISkuIFN3aXRjaGlu
ZyB0byBNRk4gd2lsbCBpbXByb3ZlCj4gc2FmZXR5IGFuZCByZWR1Y2UgdGhlIGNoYW5jZSB0byBt
aXN0YWtlbmx5IGludmVydCB0aGUgMiBwYXJhbWV0ZXJzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEp1
bGllbiBHcmFsbCA8anVsaWVuLmdyYWxsQGFybS5jb20+CgpSZXZpZXdlZC1ieTogS2V2aW4gVGlh
biA8a2V2aW4udGlhbkBpbnRlbC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
