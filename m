From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] x86/entry: Use 32bit xors rater than 64bit
 xors for clearing GPRs
Date: Thu, 15 Feb 2018 02:51:06 -0700
Message-ID: <5A85661A02000078001A7F65@prv-mh.provo.novell.com>
References: <1518614076-1615-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1518614076-1615-1-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Xen-devel <xen-devel@lists.xen.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDE0LjAyLjE4IGF0IDE0OjE0LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gSW50ZWwncyBTaWx2ZXJtb250L0tuaWdodHMgTGFuZGluZyBhcmNoaXRlY3R1cmUgdHJl
YXRzIHRoZW0gYXMgZnVsbCBBTFUKPiBvcGVyYXRpb25zLCByYXRoZXIgdGhhbiB6ZXJvaW5nIGlk
b21zLgo+IAo+IE5vIGZ1bmN0aW9uYWwgY2hhbmdlLCBhbmQgbm8gY2hhbmdlIGluIGNvZGUgdm9s
dW1lIChvbmx5IGNoYW5naW5nIHRoZSBiaXQKPiBzZWxlY3Rpb24gaW4gdGhlIFJFWCBwcmVmaXgp
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+Cj4gLS0tCj4gQ0M6IEphbiBCZXVsaWNoIDxKQmV1bGljaEBzdXNlLmNvbT4KPiAKPiBJ
ZiBhbnlvbmUgaXMgaW50ZXJlc3RlZCwgPDIwMTgwMjExMTA0OTQ5LjEyOTkyLTUtbGludXhAZG9t
aW5pa2Jyb2Rvd3NraS5uZXQ+Cj4gaXMgdGhlIExLTUwgZGlzY3Vzc29uIG9uIHRoZSBzdWJqZWN0
LiAgSXQgaXMgbW9zdCBsaWtlbHkgdGhhdCB0aGlzIGlzIGEKPiBkZWxpYmVyYXRlIHNpbXBsaWZp
Y2F0aW9uIGluIHRoZSBLbmlnaHRzKiBhcmNoaXRlY3R1cmUgYmVjYXVzZSBjb21waWxlcnMKPiBm
b2xsb3cgb3B0aW1pc2F0aW9uIGluc3RydWN0aW9ucyBvZiAidXNlIHhvcnMgZm9yIHplcm9pbmci
IGFuZCAidXNlIDMyYml0Cj4gb3BlcmF0aW9ucyBpbiBwcmVmZXJlbmNlIHRvIDY0Yml0IG9uZXMg
d2hlcmV2ZXIgcG9zc2libGUiLgoKSG1tLCB3ZSBjYW4gb25seSB0cnVzdCB3aGF0IGlzIGJlaW5n
IHNhaWQgdGhlcmUsIHdoaWNoIGlzIG5vdCB2ZXJ5Cm5pY2UuIE9yIHdhaXQsIG5vLCB0aGUgT1JN
IGFjdHVhbGx5IHNheXMgc28gZm9yIFNpbHZlcm1vbnQuCgpBY2tlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKSmFuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KWGVuLWRldmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMu
eGVucHJvamVjdC5vcmcKaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3hlbi1kZXZlbA==
