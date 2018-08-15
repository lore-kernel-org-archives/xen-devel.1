From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 08/12] xen/gnttab: Fold
 grant_table_{create, set_limits}() into grant_table_init()
Date: Wed, 15 Aug 2018 06:54:12 -0600
Message-ID: <5B74227402000078001DE60B@prv1-mh.provo.novell.com>
References: <1534154469-6076-1-git-send-email-andrew.cooper3@citrix.com>
 <1534154469-6076-9-git-send-email-andrew.cooper3@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
In-Reply-To: <1534154469-6076-9-git-send-email-andrew.cooper3@citrix.com>
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

Pj4+IE9uIDEzLjA4LjE4IGF0IDEyOjAxLCA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4gd3Jv
dGU6Cj4gTm93IHRoYXQgdGhlIG1heF97Z3JhbnQsbWFwdHJhY2t9X2ZyYW1lcyBhcmUgc3BlY2lm
aWVkIGZyb20gdGhlIHZlcnkgYmVnaW5uaW5nCj4gb2YgZ3JhbnQgdGFibGUgY29uc3RydWN0aW9u
LCB0aGUgdmFyaW91cyBpbml0aWFsaXNhdGlvbiBmdW5jdGlvbnMgY2FuIGJlCj4gZm9sZGVkIHRv
Z2V0aGVyIGFuZCBzaW1wbGlmaWVkIGFzIGEgcmVzdWx0Lgo+IAo+IExlYXZlIGdyYW50X3RhYmxl
X2luaXQoKSBhcyB0aGUgcHVibGljIGludGVyZmFjZSwgd2hpY2ggaXMgbW9yZSBjb25zaXN0ZW50
Cj4gd2l0aCBvdGhlciBzdWJzeXN0ZW1zLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEFuZHJldyBDb29w
ZXIgPGFuZHJldy5jb29wZXIzQGNpdHJpeC5jb20+CgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2gg
PGpiZXVsaWNoQHN1c2UuY29tPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
