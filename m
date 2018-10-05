From: Wei Liu <wei.liu2@citrix.com>
Subject: Re: [PATCH v14 8/9] mm / iommu: include need_iommu()
 test in iommu_use_hap_pt()
Date: Fri, 5 Oct 2018 17:03:50 +0100
Message-ID: <20181005160350.uxjqir3jaztdiqaj@zion.uk.xensource.com>
References: <20181004104547.32316-1-paul.durrant@citrix.com>
 <20181004104547.32316-9-paul.durrant@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=qudt=mr=citrix.com=prvs=80982b68a=wei.liu2@srs-us1.protection.inumbo.net>)
 id 1g8Sa2-0005uy-Kd
 for xen-devel@lists.xenproject.org; Fri, 05 Oct 2018 16:03:54 +0000
Content-Disposition: inline
In-Reply-To: <20181004104547.32316-9-paul.durrant@citrix.com>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Paul Durrant <paul.durrant@citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, George Dunlap <george.dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Jan Beulich <jbeulich@suse.com>, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhpcyBwYXRjaCBoYXMgYnJva2VuIG15IFBWSCBEb20wIHNldHVwLgoKWyAgICAyLjUxNTE1OV0g
aWdiIDAwMDA6MDI6MDAuMTogYWRkZWQgUEhDIG9uIGV0aDEKWyAgICAyLjUxOTUzOV0gaWdiIDAw
MDA6MDI6MDAuMTogSW50ZWwoUikgR2lnYWJpdCBFdGhlcm5ldCBOZXR3b3JrIENvbm5lY3Rpb24K
WyAgICAyLjUyNjQ2OV0gaWdiIDAwMDA6MDI6MDAuMTogZXRoMTogKFBDSWU6NS4wR2IvczpXaWR0
aCB4NCkgMGM6YzQ6N2E6ZTc6YjY6NTMKWyAgICAyLjUzMzczM10gaWdiIDAwMDA6MDI6MDAuMTog
ZXRoMTogUEJBIE5vOiAwMTBBMDAtMDAwClsgICAgMi41Mzg4NjBdIGlnYiAwMDAwOjAyOjAwLjE6
IFVzaW5nIE1TSS1YIGludGVycnVwdHMuIDggcnggcXVldWUocyksIDggdHggcXVldWUocykKWyAg
ICAyLjY0OTE5MV0gYXRhODogU0FUQSBsaW5rIGRvd24gKFNTdGF0dXMgMCBTQ29udHJvbCAzMDAp
ClsgICAgMi42NTQ0NjddIGF0YTE6IFNBVEEgbGluayB1cCAzLjAgR2JwcyAoU1N0YXR1cyAxMjMg
U0NvbnRyb2wgMzAwKQpbICAgIDIuNjYwNzMwXSBhdGE3OiBTQVRBIGxpbmsgZG93biAoU1N0YXR1
cyAwIFNDb250cm9sIDMwMCkKWyAgICAyLjY2NjE2Nl0gYXRhNTogU0FUQSBsaW5rIGRvd24gKFNT
dGF0dXMgMCBTQ29udHJvbCAzMDApClsgICAgMi42NzE2MTldIGF0YTM6IFNBVEEgbGluayBkb3du
IChTU3RhdHVzIDAgU0NvbnRyb2wgMzAwKQpbICAgIDIuNjc3MDczXSBhdGE2OiBTQVRBIGxpbmsg
ZG93biAoU1N0YXR1cyAwIFNDb250cm9sIDMwMCkKWyAgICAyLjY4MjUzOF0gYXRhMjogU0FUQSBs
aW5rIGRvd24gKFNTdGF0dXMgMCBTQ29udHJvbCAzMDApClsgICAgMi42ODc5ODhdIGF0YTQ6IFNB
VEEgbGluayBkb3duIChTU3RhdHVzIDAgU0NvbnRyb2wgMzAwKQpbICAgIDIuNjk0NjMyXSBhdGEx
LjAwOiBmYWlsZWQgdG8gSURFTlRJRlkgKEkvTyBlcnJvciwgZXJyX21hc2s9MHgxMDApClsgICAg
OC4yMTU3MjhdIGF0YTE6IFNBVEEgbGluayB1cCAzLjAgR2JwcyAoU1N0YXR1cyAxMjMgU0NvbnRy
b2wgMzAwKQpbICAgIDguMjIyOTQ1XSBhdGExLjAwOiBmYWlsZWQgdG8gSURFTlRJRlkgKEkvTyBl
cnJvciwgZXJyX21hc2s9MHgxMDApClsgICAgOC4yMjkwNTJdIGF0YTE6IGxpbWl0aW5nIFNBVEEg
bGluayBzcGVlZCB0byAxLjUgR2JwcwpbICAgMTMuNTkwOTkxXSBhdGExOiBTQVRBIGxpbmsgdXAg
MS41IEdicHMgKFNTdGF0dXMgMTEzIFNDb250cm9sIDMxMCkKWyAgIDEzLjU5NzE0Ml0gYXRhMS4w
MDogZmFpbGVkIHRvIElERU5USUZZIChJL08gZXJyb3IsIGVycl9tYXNrPTB4MTAwKQoKV2VpLgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVs
IG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0
cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
