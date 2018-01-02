From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] xen/x86: Drop unnecessary barriers
Date: Tue, 02 Jan 2018 09:25:35 -0700
Message-ID: <5A4BC08F020000780019A391@prv-mh.provo.novell.com>
References: <1514902636-27424-1-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1514902636-27424-1-git-send-email-andrew.cooper3@citrix.com>
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

Pj4+IE9uIDAyLjAxLjE4IGF0IDE1OjE3LCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4geDg2J3MgY3VycmVudCBpbXBsZW1lbnRhdGlvbiBvZiB3bWIoKSBpcyBhIGNvbXBpbGVy
IGJhcnJpZXIuICBBcyBhIHJlc3VsdCwgdGhlCj4gb25seSBjaGFuZ2UgaW4gdGhpcyBwYXRjaCBp
cyB0byByZW1vdmUgYW4gbWZlbmNlIGluc3RydWN0aW9uIGZyb20KPiBjcHVpZGxlX2Rpc2FibGVf
ZGVlcF9jc3RhdGUoKS4KPiAKPiBOb25lIG9mIHRoZXNlIGJhcnJpZXJzIHNlcnZlIGFueSBwdXJw
b3NlLiAgVGhleSBhcmUgbm90IHN5bmNocm9uaXNpbmcgd2l0aAo+IHJlbW90ZSBjcHVzLCBhbmQg
dGhlaXIgY29tcGlsZXItYmFycmllciBwcm9wZXJ0aWVzIGFyZSBub3QgbmVlZGVkIGZvcgo+IGNv
cnJlY3RuZXNzIHB1cnBvc2VzLgo+IAo+IEZ1cnRoZXJtb3JlLCB0aGVzZSB3bWIoKSdzIHNwZWNp
ZmljYWxseSBkbyBub3Qgd2FudCB0byB0dXJuIGludG8gc2ZlbmNlCj4gaW5zdHJ1Y3Rpb25zIGlu
IGZ1dHVyZSBjaGFuZ2VzIHdoZXJlIHdtYigpJ3MgaW1wbGVtZW50YXRpb24gaXMgY29ycmVjdGVk
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29wZXIgPGFuZHJldy5jb29wZXIzQGNpdHJp
eC5jb20+CgpBY2tlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFp
bGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhl
bnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8veGVuLWRldmVs
