From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v2 06/16] x86/amd: call post outb hook for
 both PV and HVM
Date: Fri, 19 Oct 2018 16:55:11 +0100
Message-ID: <20181019155511.lezsq2ooygg2bye3@zion.uk.xensource.com>
References: <cover.a9d086fddeb7425fc8cbb3d907dbe8d99a55b46c.1539959287.git-series.wei.liu2@citrix.com>
 <a1bbfcc3bf759669a53c5ef739ab67d01187f892.1539959287.git-series.wei.liu2@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=jk7c=m7=citrix.com=prvs=8230e4c9f=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1gDX7L-0005Se-Oj
 for xen-devel@lists.xenproject.org; Fri, 19 Oct 2018 15:55:15 +0000
Content-Disposition: inline
In-Reply-To: <a1bbfcc3bf759669a53c5ef739ab67d01187f892.1539959287.git-series.wei.liu2@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel@lists.xenproject.org
Cc: Andrew Cooper <andrew.cooper3@citrix.com>, Paul Durrant <paul.durrant@citrix.com>, Wei Liu <wei.liu2@citrix.com>, Jan Beulich <jbeulich@suse.com>
List-Id: xen-devel@lists.xenproject.org

T24gRnJpLCBPY3QgMTksIDIwMTggYXQgMDM6Mjg6MzJQTSArMDEwMCwgV2VpIExpdSB3cm90ZToK
PiBUaGUgaXNzdWUgZGVzY3JpYmVkIGluIDEwZDAzMzQyOTEyIGlzIGFwcGxpY2FibGUgdG8gYm90
aCBQViBhbmQgSFZNCj4gZG9tYWlucyB0aGF0IGhhdmUgYWNjZXNzIHRvIHRoYXQgU01JIENNRCBw
b3J0Lgo+IAo+IE1vdmUgdGhlIGhvb2sgdG8gQU1EIGNvZGUsIHJlbW92ZSBpdHMgcHZfIHByZWZp
eCBhbmQgY2FsbCBpdCBpbiBib3RoCj4gUFYgYW5kIEhWTSBjb2RlLgo+IAo+IFNpZ25lZC1vZmYt
Ynk6IFdlaSBMaXUgPHdlaS5saXUyQGNpdHJpeC5jb20+CgpJZ25vcmUgdGhpcyBwYXRjaC4gUm9n
ZXIgaGFzIHBvc3RlZCBhbm90aGVyIHBhdGNoIHRvIGZpeCB0aGlzLgoKV2VpLgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcg
bGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9q
ZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
