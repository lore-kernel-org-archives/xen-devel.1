From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 3/5] xen/domain: Call
 lock_profile_deregister_struct() from common code
Date: Mon, 03 Sep 2018 10:05:58 -0600
Message-ID: <5B8D5BE602000078001E4C54@prv1-mh.provo.novell.com>
References: <1535986020-15906-1-git-send-email-andrew.cooper3@citrix.com>
 <1535986020-15906-4-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1535986020-15906-4-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAzLjA5LjE4IGF0IDE2OjQ2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gbG9ja19wcm9maWxlX3JlZ2lzdGVyX3N0cnVjdCgpIGlzIGNhbGxlZCBmcm9tIGNvbW1v
biBjb2RlLCBidXQgdGhlIG1hdGNoaW5nCj4gZGVyZWdpc3RlciB3YXMgcHJldmlvdXNseSBvbmx5
IGNhbGxlZCBmcm9tIHg4NiBjb2RlLgo+IAo+IFRoZSBwcmFjdGljYWwgdXBzaG90IG9mIHRoaXMg
d2hlbiB1c2luZyBDT05GSUdfTE9DS19QUk9GSUxFLCBkZXN0cm95ZWQgZG9tYWlucwo+IG9uIEFS
TSAoYW5kIGluIHBhcnRpY3VsYXIsIHRoZSBmcmVlZCBwYWdlIGJlaGluZCBzdHJ1Y3QgZG9tYWlu
KSByZW1haW4gb24gdGhlCj4gbG9ja3Byb2ZpbGUgbGlua2VkIGxpc3QsIHdoaWNoIHdpbGwgYmVj
b21lIGNvcnJ1cHQgd2hlbiB0aGUgcGFnZSBpcyByZXVzZWQuCj4gCj4gU2lnbmVkLW9mZi1ieTog
QW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KCkFja2VkLWJ5OiBKYW4g
QmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxp
c3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9s
aXN0aW5mby94ZW4tZGV2ZWw=
