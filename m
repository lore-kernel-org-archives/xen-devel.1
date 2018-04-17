From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 6/8] x86/HVM: Hook up miscellaneous AVIC
 functions
Date: Tue, 17 Apr 2018 07:10:28 -0600
Message-ID: <5AD5F24402000078001BC182@prv1-mh.provo.novell.com>
References: <cover.1522794651.git.Janakarajan.Natarajan@amd.com>
 <3dc3f58c8d2362125032783b373704d1207e6914.1522794651.git.Janakarajan.Natarajan@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <3dc3f58c8d2362125032783b373704d1207e6914.1522794651.git.Janakarajan.Natarajan@amd.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Janakarajan Natarajan <Janakarajan.Natarajan@amd.com>
Cc: Tim Deegan <tim@xen.org>, Kevin Tian <kevin.tian@intel.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Ian Jackson <Ian.Jackson@eu.citrix.com>, xen-devel@lists.xen.org, Julien Grall <julien.grall@arm.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA0LjE4IGF0IDAxOjAxLCA8SmFuYWthcmFqYW4uTmF0YXJhamFuQGFtZC5jb20+
IHdyb3RlOgo+IC0tLSBhL3hlbi9hcmNoL3g4Ni9odm0vc3ZtL3N2bS5jCj4gKysrIGIveGVuL2Fy
Y2gveDg2L2h2bS9zdm0vc3ZtLmMKPiBAQCAtMTcxMSw3ICsxNzExLDEwIEBAIGNvbnN0IHN0cnVj
dCBodm1fZnVuY3Rpb25fdGFibGUgKiBfX2luaXQgc3RhcnRfc3ZtKHZvaWQpCj4gICAgICAgICAg
c3ZtX2F2aWMgPSAwOwo+ICAKPiAgICAgIGlmICggc3ZtX2F2aWMgKQo+ICsgICAgewo+ICAgICAg
ICAgIHN2bV9mdW5jdGlvbl90YWJsZS5kZWxpdmVyX3Bvc3RlZF9pbnRyICA9IHN2bV9hdmljX2Rl
bGl2ZXJfcG9zdGVkX2ludHI7Cj4gKyAgICAgICAgc3ZtX2Z1bmN0aW9uX3RhYmxlLnZpcnR1YWxf
aW50cl9kZWxpdmVyeV9lbmFibGVkID0gc3ZtX2F2aWM7CgpDb25zaWRlcmluZyB0aGUgY29udHJv
bGxpbmcgZXhwcmVzc2lvbiBvZiB0aGUgaWYoKSB3ZSdyZSBpbiwgd2h5IG5vdCBzaW1wbHkgInRy
dWUiPwoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3Jn
Cmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
