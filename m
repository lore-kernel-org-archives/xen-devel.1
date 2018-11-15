From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v3 3/5] xen/domain: Move guest type checks
 into the arch_sanitise_domain_config() path
Date: Thu, 15 Nov 2018 03:51:02 -0700
Message-ID: <5BED4F9602000078001FC4F2@prv1-mh.provo.novell.com>
References: <1542039391-32406-4-git-send-email-andrew.cooper3@citrix.com>
 <1542217484-11659-1-git-send-email-andrew.cooper3@citrix.com>
 <013C0C6C020000F58E2C01CD@prv1-mh.provo.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <013C0C6C020000F58E2C01CD@prv1-mh.provo.novell.com>
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
Cc: Julien Grall <julien.grall@arm.com>, Stefano Stabellini <sstabellini@kernel.org>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjExLjE4IGF0IDE4OjQ0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gVGhpcyBpcyBhIG1vcmUgYXBwcm9wcmlhdGUgbG9jYXRpb24gZm9yIHRoZSBjaGVja3Mg
dG8gaGFwcGVuLCBhbmQgY2xlYW5zIHVwCj4gdGhlIGNvbW1vbiBjb2RlIHN1YnN0YW50aWFsbHku
Cj4gCj4gVGFrZSB0aGUgb3Bwb3J0dW5pdHkgdG8gbWFrZSBBUk0gc3RyaWN0bHkgcmVxdWlyZSBI
Vk18SEFQIGZvciBndWVzdHMsIHdoaWNoIGlzCj4gaG93IHRoZSB0b29sc3RhY2sgYmVoYXZlcywg
YW5kIGxlYXZlIGEgZHByaW50aygpIGJlaGluZCBmb3IgYXVkaXRpbmcgZmFpbHVyZXMuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4K
ClJldmlld2VkLWJ5OiBKYW4gQmV1bGljaCA8amJldWxpY2hAc3VzZS5jb20+CgoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5n
IGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJv
amVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
