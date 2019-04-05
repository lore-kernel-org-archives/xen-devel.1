From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 2/5] x86/cpu: Introduce
 x86_cpuid_vendor_to_str() and drop cpu_dev.c_vendor[]
Date: Fri, 05 Apr 2019 02:59:39 -0600
Message-ID: <5CA718FB0200007800224CCB@prv1-mh.provo.novell.com>
References: <1554409592-28572-1-git-send-email-andrew.cooper3@citrix.com>
 <1554409592-28572-3-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1554409592-28572-3-git-send-email-andrew.cooper3@citrix.com>
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
Cc: Pu Wen <puwen@hygon.cn>, Davidwang <Davidwang@zhaoxin.com>, Xen-devel <xen-devel@lists.xen.org>, Wei Liu <wei.liu2@citrix.com>, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA0LjA0LjE5IGF0IDIyOjI2LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gY3B1X2Rldi5jX3ZlbmRvcltdIGlzIGEgY2hhcls4XSBhcnJheSB3aGljaCBpcyBwcmlu
dGVkIHVzaW5nICVzIGluIHR3bwo+IGxvY2F0aW9ucy4gIFRoaXMgbGVhZHMgdG8gc3VidGxlIGxh
Y2stb2YtTlVMIGJ1Z3Mgd2hlbiB1c2luZyBhbiA4IGNoYXJhY3Rlcgo+IHZlbmRvciBuYW1lLgo+
IAo+IEludHJvZHVjZSB4ODZfY3B1aWRfdmVuZG9yX3RvX3N0cigpIHRvIHR1cm4gYW4geDg2X3Zl
bmRvciBpbnRvIGEgcHJpbnRhYmxlCj4gc3RyaW5nLCB1c2UgaXQgaW4gdGhlIHR3byBsb2NhdGlv
bnMgdGhhdCBjX3ZlbmRvciBpcyB1c2VkLCBhbmQgZHJvcCAKPiBjX3ZlbmRvci4KPiAKPiBUaGlz
IGRyb3BzIHRoZSBmaW5hbCB1c2VyIG9mIFg4Nl9WRU5ET1JfTlVNLCBzbyBkcm9wIHRoYXQgYXMg
d2VsbC4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBBbmRyZXcgQ29vcGVyIDxhbmRyZXcuY29vcGVyM0Bj
aXRyaXguY29tPgoKUmV2aWV3ZWQtYnk6IEphbiBCZXVsaWNoIDxqYmV1bGljaEBzdXNlLmNvbT4K
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KWGVuLWRl
dmVsIG1haWxpbmcgbGlzdApYZW4tZGV2ZWxAbGlzdHMueGVucHJvamVjdC5vcmcKaHR0cHM6Ly9s
aXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL3hlbi1kZXZlbA==
