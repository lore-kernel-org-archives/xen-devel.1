From: Ross Lagerwall <ross.lagerwall@citrix.com>
Subject: Re: [PATCH net-next] xen-netfront: fix queue name
 setting
Date: Fri, 20 Jul 2018 17:49:00 +0100
Message-ID: <566f2c29-a7c0-efee-444c-c51a632bfeee__18684.8552468748$1532105281$gmane$org@citrix.com>
References: <20180720163359.28187-1-vkuznets@redhat.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=8qp7=ke=citrix.com=prvs=73291e50a=ross.lagerwall@srs-us1.protection.inumbo.net>)
 id 1fgYaY-0002yG-NG
 for xen-devel@lists.xenproject.org; Fri, 20 Jul 2018 16:49:06 +0000
In-Reply-To: <20180720163359.28187-1-vkuznets@redhat.com>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Vitaly Kuznetsov <vkuznets@redhat.com>, netdev@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>, xen-devel@lists.xenproject.org, Boris Ostrovsky <boris.ostrovsky@oracle.com>, linux-kernel@vger.kernel.org
List-Id: xen-devel@lists.xenproject.org

T24gMDcvMjAvMjAxOCAwNTozMyBQTSwgVml0YWx5IEt1em5ldHNvdiB3cm90ZToKPiBDb21taXQg
ZjU5OWM2NGZkZjdkICgieGVuLW5ldGZyb250OiBGaXggcmFjZSBiZXR3ZWVuIGRldmljZSBzZXR1
cCBhbmQKPiBvcGVuIikgY2hhbmdlZCB0aGUgaW5pdGlhbGl6YXRpb24gb3JkZXI6IHhlbm5ldF9j
cmVhdGVfcXVldWVzKCkgbm93Cj4gaGFwcGVucyBiZWZvcmUgd2UgZG8gcmVnaXN0ZXJfbmV0ZGV2
KCkgc28gdXNpbmcgbmV0ZGV2LT5uYW1lIGluCj4geGVubmV0X2luaXRfcXVldWUoKSBpcyBpbmNv
cnJlY3QsIHdlIGVuZCB1cCB3aXRoIHRoZSBmb2xsb3dpbmcgaW4KPiAvcHJvYy9pbnRlcnJ1cHRz
Ogo+IAo+ICAgNjA6ICAgICAgICAxMzkgICAgICAgICAgMCAgIHhlbi1keW4gICAgLWV2ZW50ICAg
ICBldGglZC1xMC10eAo+ICAgNjE6ICAgICAgICAyNjUgICAgICAgICAgMCAgIHhlbi1keW4gICAg
LWV2ZW50ICAgICBldGglZC1xMC1yeAo+ICAgNjI6ICAgICAgICAyMzQgICAgICAgICAgMCAgIHhl
bi1keW4gICAgLWV2ZW50ICAgICBldGglZC1xMS10eAo+ICAgNjM6ICAgICAgICAgIDEgICAgICAg
ICAgMCAgIHhlbi1keW4gICAgLWV2ZW50ICAgICBldGglZC1xMS1yeAo+IAo+IGFuZCB0aGlzIGxv
b2tzIHVnbHkuIEFjdHVhbGx5LCB1c2luZyBlYXJseSBuZXRkZXYgbmFtZSAoZXZlbiB3aGVuIGl0
J3MKPiBhbHJlYWR5IHNldCkgaXMgYWxzbyBub3QgaWRlYWw6IG5vd2FkYXlzIHdlIHRlbmQgdG8g
cmVuYW1lIGV0aCBkZXZpY2VzCj4gYW5kIHF1ZXVlIG5hbWUgbWF5IGVuZCB1cCBub3QgY29ycmVz
cG9uZGluZyB0byB0aGUgbmV0ZGV2IG5hbWUuCj4gCj4gVXNlIG5vZGVuYW1lIGZyb20geGVuYnVz
IGRldmljZSBmb3IgcXVldWUgbmFtaW5nOiB0aGlzIGNhbid0IGNoYW5nZSBpbiBWTSdzCj4gbGlm
ZXRpbWUuIE5vdyAvcHJvYy9pbnRlcnJ1cHRzIGxvb2tzIGxpa2UKPiAKPiAgIDYyOiAgICAgICAg
MjAyICAgICAgICAgIDAgICB4ZW4tZHluICAgIC1ldmVudCAgICAgZGV2aWNlL3ZpZi8wLXEwLXR4
Cj4gICA2MzogICAgICAgIDMxNyAgICAgICAgICAwICAgeGVuLWR5biAgICAtZXZlbnQgICAgIGRl
dmljZS92aWYvMC1xMC1yeAo+ICAgNjQ6ICAgICAgICAyNjIgICAgICAgICAgMCAgIHhlbi1keW4g
ICAgLWV2ZW50ICAgICBkZXZpY2UvdmlmLzAtcTEtdHgKPiAgIDY1OiAgICAgICAgIDE3ICAgICAg
ICAgIDAgICB4ZW4tZHluICAgIC1ldmVudCAgICAgZGV2aWNlL3ZpZi8wLXExLXJ4Cj4gCj4gRml4
ZXM6IGY1OTljNjRmZGY3ZCAoInhlbi1uZXRmcm9udDogRml4IHJhY2UgYmV0d2VlbiBkZXZpY2Ug
c2V0dXAgYW5kIG9wZW4iKQo+IFNpZ25lZC1vZmYtYnk6IFZpdGFseSBLdXpuZXRzb3YgPHZrdXpu
ZXRzQHJlZGhhdC5jb20+Cj4gLS0tCgpSZXZpZXdlZC1ieTogUm9zcyBMYWdlcndhbGwgPHJvc3Mu
bGFnZXJ3YWxsQGNpdHJpeC5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54ZW5w
cm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGluZm8v
eGVuLWRldmVs
