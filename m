From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH for-4.12 v4 2/3] x86/svm: Drop enum
 instruction_index and simplify svm_get_insn_len()
Date: Fri, 01 Feb 2019 02:31:47 -0700
Message-ID: <5C5412030200007800213111@prv1-mh.provo.novell.com>
References: <1546256270-11734-3-git-send-email-andrew.cooper3@citrix.com>
 <1548959060-25387-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1548959060-25387-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Juergen Gross <jgross@suse.com>, Wei Liu <wei.liu2@citrix.com>, Xen-devel <xen-devel@lists.xen.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, Boris Ostrovsky <boris.ostrovsky@oracle.com>, Brian Woods <brian.woods@amd.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDMxLjAxLjE5IGF0IDE5OjI0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gUGFzc2luZyBhIDMyLWJpdCBpbnRlZ2VyIGluZGV4IGludG8gYW4gYXJyYXkgd2l0aCBl
bnRyaWVzIGNvbnRhaW5pbmcgbGVzcyAKPiB0aGFuCj4gMzIgYml0cyBvZiBkYXRhIGlzIHdhc3Rl
ZnVsLCBhbmQgY3JlYXRlcyBhbiB1bm5lY2Vzc2FyeSBlcnJvciBjb25kaXRpb24gb2YKPiBwYXNz
aW5nIGFuIG91dC1vZi1yYW5nZSBpbmRleC4KPiAKPiBUaGUgd2lkdGggb2YgdGhlIFg4NkVNVUxf
T1BDKCkgZW5jb2RpbmcgaXMgY3VycmVudGx5IDIwIGJpdHMgZm9yIHRoZQo+IGluc3RydWN0aW9u
cyB1c2VkLCB3aGljaCBsZWF2ZXMgcm9vbSBmb3IgYSBtb2RybSBieXRlLiAgRHJvcCBvcGNfdGFi
W10KPiBlbnRpcmVseSwgYW5kIGVuY29kZSB0aGUgZXhwZWN0ZWQgb3Bjb2RlL21vZHJtIGluZm9y
bWF0aW9uIGRpcmVjdGx5Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJl
dy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNo
QHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9y
ZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
