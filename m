From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 5/6] x86/vmx: Defer vmx_vmcs_exit() as long
 as possible in construct_vmcs()
Date: Tue, 29 May 2018 05:43:28 -0600
Message-ID: <5B0D3CE002000078001C68F2@prv1-mh.provo.novell.com>
References: <1527517678-1779-1-git-send-email-andrew.cooper3@citrix.com>
 <1527517678-1779-6-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1527517678-1779-6-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Jun Nakajima <jun.nakajima@intel.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI4LjA1LjE4IGF0IDE2OjI3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gcGFnaW5nX3VwZGF0ZV9wYWdpbmdfbW9kZXMoKSBhbmQgdm14X3ZsYXBpY19tc3JfY2hh
bmdlZCgpIGJvdGggb3BlcmF0ZSBvbiB0aGUKPiBWTUNTIGJlaW5nIGNvbnN0cnVjdGVkLiAgQXZv
aWQgZHJvcHBpbmcgYW5kIHJlLWFjcXVpcmluZyB0aGUgcmVmZXJlbmNlCj4gbXVsdGlwbGUgdGlt
ZXMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0
cml4LmNvbT4KClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZl
bCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlz
dHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
