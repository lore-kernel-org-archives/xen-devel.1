From: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH RFC 05/16] Save/Restore Support: Add kernel
 shutdown logic to shutdown.c
Date: Thu, 21 Dec 2017 17:49:11 -0500
Message-ID: <20171221224910.GH13559@char.us.oracle.com>
References: <1513726931-7516-1-git-send-email-bruno.alvisio@gmail.com>
 <1513726931-7516-6-git-send-email-bruno.alvisio@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2) (envelope-from
 <srs0=uflf=dr=oracle.com=konrad.wilk@srs-us1.protection.inumbo.net>)
 id 1eS9fd-0000e8-CX
 for xen-devel@lists.xenproject.org; Thu, 21 Dec 2017 22:50:33 +0000
Content-Disposition: inline
In-Reply-To: <1513726931-7516-6-git-send-email-bruno.alvisio@gmail.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Bruno Alvisio <bruno.alvisio@gmail.com>
Cc: minios-devel@lists.xenproject.org, xen-devel@lists.xenproject.org, wei.liu2@citrix.com, jgross@suse.com, samuel.thibault@ens-lyon.org
List-Id: xen-devel@lists.xenproject.org

LnNuaXAuLgo+IGRpZmYgLS1naXQgYS9zaHV0ZG93bi5jIGIvc2h1dGRvd24uYwo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMC4uYjNjZWE2ZAo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9zaHV0ZG93bi5jCj4gQEAgLTAsMCArMSwxODggQEAKPiArLyoKPiArICogICAgICAgICAg
TWluaU9TCj4gKyAqCj4gKyAqICAgZmlsZTogZnJvbWRldmljZS5jYwo+ICsgKgo+ICsgKiAgICAg
ICAgICBORUMgRXVyb3BlIEx0ZC4gUFJPUFJJRVRBUlkgSU5GT1JNQVRJT04KPiArICoKPiArICog
VGhpcyBzb2Z0d2FyZSBpcyBzdXBwbGllZCB1bmRlciB0aGUgdGVybXMgb2YgYSBsaWNlbnNlIGFn
cmVlbWVudAo+ICsgKiBvciBub25kaXNjbG9zdXJlIGFncmVlbWVudCB3aXRoIE5FQyBFdXJvcGUg
THRkLiBhbmQgbWF5IG5vdCBiZQo+ICsgKiBjb3BpZWQgb3IgZGlzY2xvc2VkIGV4Y2VwdCBpbiBh
Y2NvcmRhbmNlIHdpdGggdGhlIHRlcm1zIG9mIHRoYXQKPiArICogYWdyZWVtZW50LiBUaGUgc29m
dHdhcmUgYW5kIGl0cyBzb3VyY2UgY29kZSBjb250YWluIHZhbHVhYmxlIHRyYWRlCgpVbT8hPwoK
PiArICogc2VjcmV0cyBhbmQgY29uZmlkZW50aWFsIGluZm9ybWF0aW9uIHdoaWNoIGhhdmUgdG8g
YmUgbWFpbnRhaW5lZCBpbgo+ICsgKiBjb25maWRlbmNlLgo+ICsgKiBBbnkgdW5hdXRob3JpemVk
IHB1YmxpY2F0aW9uLCB0cmFuc2ZlciB0byB0aGlyZCBwYXJ0aWVzIG9yIGR1cGxpY2F0aW9uCj4g
KyAqIG9mIHRoZSBvYmplY3Qgb3Igc291cmNlIGNvZGUgLSBlaXRoZXIgdG90YWxseSBvciBpbiBw
YXJ0IOKAkyBpcwo+ICsgKiBwcm9oaWJpdGVkLgoKU28gLi4uIHRoaXMgbmVlZHMgdG8gYmUgYSBk
aWZmZXJlbnQgbGljZW5zZSBJIHRoaW5rLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
