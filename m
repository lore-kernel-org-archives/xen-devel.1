From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH v2 for-next 3/9] gcov: rename sysctl and
 functions
Date: Tue, 23 Jan 2018 02:37:48 -0700
Message-ID: <5A67107C02000078001A16E9@prv-mh.provo.novell.com>
References: <20171109111349.95800-1-roger.pau@citrix.com>
 <20171109111349.95800-4-roger.pau@citrix.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.84_2)
 (envelope-from <srs0=2ufb=es=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1edv1j-0000mo-Uh
 for xen-devel@lists.xenproject.org; Tue, 23 Jan 2018 09:37:59 +0000
In-Reply-To: <20171109111349.95800-4-roger.pau@citrix.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Wei Liu <wei.liu2@citrix.com>, Ian Jackson <ian.jackson@eu.citrix.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>, George Dunlap <George.Dunlap@eu.citrix.com>, Andrew Cooper <andrew.cooper3@citrix.com>, Tim Deegan <tim@xen.org>, xen-devel@lists.xenproject.org, Roger Pau Monne <roger.pau@citrix.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDA5LjExLjE3IGF0IDEyOjEzLCA8cm9nZXIucGF1QGNpdHJpeC5jb20+IHdyb3RlOgo+
IENoYW5nZSBnY292IHRvIGNvdiAoZm9yIGludGVybmFsIGludGVyZmFjZXMpIG9yIGNvdmVyYWdl
IChmb3IgdGhlCj4gcHVibGljIG9uZXMpLgo+IAo+IFNpZ25lZC1vZmYtYnk6IFJvZ2VyIFBhdSBN
b25uw6kgPHJvZ2VyLnBhdUBjaXRyaXguY29tPgo+IC0tLQo+IENjOiBJYW4gSmFja3NvbiA8aWFu
LmphY2tzb25AZXUuY2l0cml4LmNvbT4KPiBDYzogV2VpIExpdSA8d2VpLmxpdTJAY2l0cml4LmNv
bT4KPiBDYzogQW5kcmV3IENvb3BlciA8YW5kcmV3LmNvb3BlcjNAY2l0cml4LmNvbT4KPiBDYzog
R2VvcmdlIER1bmxhcCA8R2VvcmdlLkR1bmxhcEBldS5jaXRyaXguY29tPgo+IENjOiBKYW4gQmV1
bGljaCA8amJldWxpY2hAc3VzZS5jb20+Cj4gQ2M6IEtvbnJhZCBSemVzenV0ZWsgV2lsayA8a29u
cmFkLndpbGtAb3JhY2xlLmNvbT4KPiBDYzogU3RlZmFubyBTdGFiZWxsaW5pIDxzc3RhYmVsbGlu
aUBrZXJuZWwub3JnPgo+IENjOiBUaW0gRGVlZ2FuIDx0aW1AeGVuLm9yZz4KPiAtLS0KPiBDaGFu
Z2VzIHNpbmNlIHYxOgo+ICAtIFVzZSBjb3ZlcmFnZSBpbnN0ZWFkIG9mIGNvdiBpbiB0aGUgcHVi
bGljIGludGVyZmFjZS4KPiAtLS0KPiAgdG9vbHMvbWlzYy94ZW5jb3YuYyAgICAgICAgIHwgMjgg
KysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLQoKQnR3LiwgSSBzdGlsbCBoYXZlIHRoaXMgKGFu
ZCBzdWJzZXF1ZW50IHBhdGNoZXMgaW4gdGhlIHNlcmllcykgb24gbXkKbGlzdCBvZiB0aGluZ3Mg
d2FudGluZyB0byBiZSBjb21taXR0ZWQsIGJ1dCB0aGlzIG5lZWRzIGEgdG9vbHMKbWFpbnRhaW5l
cidzIGFjayBiZWZvcmUgaXQgY2FuIGdvIGluLgoKSmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZl
bEBsaXN0cy54ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxt
YW4vbGlzdGluZm8veGVuLWRldmVs
