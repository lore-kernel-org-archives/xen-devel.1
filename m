From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 0/4] x86: Drop PVRDTSCP and fix MSR_TSC_AUX
 handling for guests
Date: Fri, 16 Nov 2018 03:11:16 -0700
Message-ID: <5BEE97C402000078001FCB10@prv1-mh.provo.novell.com>
References: <1542318438-20319-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1542318438-20319-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Kevin Tian <kevin.tian@intel.com>, Wei Liu <wei.liu2@citrix.com>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, Xen-devel <xen-devel@lists.xen.org>, Jun Nakajima <jun.nakajima@intel.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE1LjExLjE4IGF0IDIyOjQ3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gQm9yaXMgaGFzIGNvbmZpcm1lZCB0aGF0IG5vb25lIGFwcGVhcnMgdG8gYmUgdXNpbmcg
UFZSRFRTQ1AgYW55IG1vcmUsIGFuZCBpbgo+IHRoZSBkZWNhZGUgc2luY2UgaXQgd2FzIGludHJv
ZHVjZWQsIGd1ZXN0IGtlcm5lbCAvIGhhcmR3YXJlIHN1cHBvcnQgaGFzCj4gcHJvdmlkZWQgYSBi
ZXR0ZXIgYWx0ZXJuYXRpdmUuCgpEb2Vzbid0IHJlbW92YWwgb2YgZnVuY3Rpb25hbGl0eSByZXF1
aXJlIGtub3dpbmcgdGhhdCBpdCB3YXMgbmV2ZXIgdXNlZAphdCBhbGwsIHJhdGhlciB0aGFuIGp1
c3Qga25vd2luZyB0aGF0IG5vdGhpbmcgdXNlcyBpdCBhbnltb3JlPyBXaGF0IGlmCnNvbWUgb2xk
IGd1ZXN0IHNvbWV3aGVyZSByZWxpZXMgb24gaXQ/CgpKYW4KCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4t
ZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9t
YWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
