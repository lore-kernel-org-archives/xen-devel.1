From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [RFC PATCH v2] tools: libxl/xl: run NUMA placement
 even when an hard-affinity is set
Date: Wed, 31 Oct 2018 15:24:54 +0000
Message-ID: <20181031152454.w3dnlozbql5r6pta@zion.uk.xensource.com>
References: <153996448146.11272.14650304608503570266.stgit@wayrath>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57]
 helo=us1-amaz-eas2.inumbo.com)
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qv1o=nl=citrix.com=prvs=835e3026f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gHsMc-0004TQ-TN
 for xen-devel@lists.xenproject.org; Wed, 31 Oct 2018 15:24:58 +0000
Content-Disposition: inline
In-Reply-To: <153996448146.11272.14650304608503570266.stgit@wayrath>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Dario Faggioli <dfaggioli@suse.com>
Cc: xen-devel@lists.xenproject.org, Ian Jackson <ian.jackson@eu.citrix.com>, Wei Liu <wei.liu2@citrix.com>, George Dunlap <george.dunlap@citrix.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMTksIDIwMTggYXQgMDU6NTQ6NDFQTSArMDIwMCwgRGFyaW8gRmFnZ2lvbGkg
d3JvdGU6Cj4gUmlnaHQgbm93LCBpZiBlaXRoZXIgYW4gaGFyZCBvciBzb2Z0LWFmZmluaXR5IGFy
ZSBleHBsaWNpdGx5IHNwZWNpZmllZAo+IGluIGEgZG9tYWluJ3MgY29uZmlnIGZpbGUsIGF1dG9t
YXRpYyBOVU1BIHBsYWNlbWVudCBpcyBza2lwcGVkLiBIb3dldmVyLAo+IGF1dG9tYXRpYyBOVU1B
IHBsYWNlbWVudCBhZmZlY3RzIG9ubHkgdGhlIHNvZnQtYWZmaW5pdHkgb2YgdGhlIGRvbWFpbgo+
IHdoaWNoIGlzIGJlaW5nIGNyZWF0ZWQuCj4gCj4gVGhlcmVmb3JlLCBpdCBpcyBvayB0byBsZXQg
aXQgcnVuIGlmIGFuIGhhcmQtYWZmaW5pdHkgaXMgc3BlY2lmaWVkLiBUaGUKPiBzZW1hbnRpY3Mg
d2lsbCBiZSB0aGF0IHRoZSBiZXN0IHBsYWNlbWVudCBjYW5kaWRhdGUgd291bGQgYmUgZm91bmQs
Cj4gcmVzcGVjdGluZyB0aGUgc3BlY2lmaWVkIGhhcmQtYWZmaW5pdHksIGkuZS4sIHVzaW5nIG9u
bHkgdGhlIG5vZGVzIHRoYXQKPiBjb250YWluIHRoZSBwY3B1cyBpbiB0aGUgaGFyZC1hZmZpbml0
eSBtYXNrLgo+IAo+IFRoaXMgaXMgcGFydGljdWxhcmx5IGhlbHBmdWwgaWYgZ2xvYmFsIHhsIHBp
bm5pbmcgbWFza3MgYXJlIGRlZmluZWQsIGFzCj4gbWFkZSBwb3NzaWJsZSBieSBjb21taXQgYWE2
N2I5N2VkMzQyNzljNDMgKCJ4bC5jb25mOiBBZGQgZ2xvYmFsIGFmZmluaXR5Cj4gbWFza3MiKS4g
SW4gZmFjdCwgd2l0aG91dCB0aGlzIGNvbW1pdCwgZGVmaW5pbmcgYSBnbG9iYWwgYWZmaW5pdHkg
bWFzawo+IHdvdWxkIGFsc28gbWVhbiBkaXNhYmxpbmcgYXV0b21hdGljIHBsYWNlbWVudCwgYnV0
IHRoYXQgZG9lcyBub3QKPiBuZWNlc3NhcmlseSBoYXZlIHRvIGJlIHRoZSBjYXNlIChlc3BlY2lh
bGx5IGluIGxhcmdlIHN5c3RlbXMpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IERhcmlvIEZhZ2dpb2xp
IDxkZmFnZ2lvbGlAc3VzZS5jb20+CgpBY2tlZC1ieTogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4
LmNvbT4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhl
bi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBz
Oi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
