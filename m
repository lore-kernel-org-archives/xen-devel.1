From: Xiao Liang <xiliang@redhat.com>
Subject: Re: [PATCH] xen-netfront: wait xenbus state change when
 load module manually
Date: Mon, 30 Jul 2018 16:18:10 +0800
Message-ID: <60e93e09-7dc2-d2f6-379d-c1d086aa1f49__23992.4971866005$1532938635$gmane$org@redhat.com>
References: <20180727095608.25210-1-xiliang@redhat.com>
 <20180729.083040.53901922165497594.davem@davemloft.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89) (envelope-from
 <srs0=5mdi=ko=redhat.com=xiliang@srs-us1.protection.inumbo.net>)
 id 1fk3Nh-0001wf-98
 for xen-devel@lists.xenproject.org; Mon, 30 Jul 2018 08:18:17 +0000
In-Reply-To: <20180729.083040.53901922165497594.davem@davemloft.net>
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: David Miller <davem@davemloft.net>
Cc: jgross@suse.com, netdev@vger.kernel.org, boris.ostrovsky@oracle.com, linux-kernel@vger.kernel.org, xen-devel@lists.xenproject.org
List-Id: xen-devel@lists.xenproject.org

VGhhbmtzLCBEYXZpZAoKT24gMDcvMjkvMjAxOCAxMTozMCBQTSwgRGF2aWQgTWlsbGVyIHdyb3Rl
Ogo+IEZyb206IFhpYW8gTGlhbmcgPHhpbGlhbmdAcmVkaGF0LmNvbT4KPiBEYXRlOiBGcmksIDI3
IEp1bCAyMDE4IDE3OjU2OjA4ICswODAwCj4KPj4gQEAgLTEzMzAsNiArMTMzMSwxMSBAQCBzdGF0
aWMgc3RydWN0IG5ldF9kZXZpY2UgKnhlbm5ldF9jcmVhdGVfZGV2KHN0cnVjdCB4ZW5idXNfZGV2
aWNlICpkZXYpCj4+ICAgCW5ldGlmX2NhcnJpZXJfb2ZmKG5ldGRldik7Cj4+ICAgCj4+ICAgCXhl
bmJ1c19zd2l0Y2hfc3RhdGUoZGV2LCBYZW5idXNTdGF0ZUluaXRpYWxpc2luZyk7Cj4+ICsJd2Fp
dF9ldmVudChtb2R1bGVfbG9hZF9xLAo+PiArCQkJICAgeGVuYnVzX3JlYWRfZHJpdmVyX3N0YXRl
KGRldi0+b3RoZXJlbmQpICE9Cj4+ICsJCQkgICBYZW5idXNTdGF0ZUNsb3NlZCAmJgo+PiArCQkJ
ICAgeGVuYnVzX3JlYWRfZHJpdmVyX3N0YXRlKGRldi0+b3RoZXJlbmQpICE9Cj4+ICsJCQkgICBY
ZW5idXNTdGF0ZVVua25vd24pOwo+PiAgIAlyZXR1cm4gbmV0ZGV2Owo+PiAgIAo+PiAgICBleGl0
Ogo+IFdoYXQgcGVyZm9ybXMgdGhlIHdha2V1cHMgdGhhdCB3aWxsIHRyaWdnZXIgZm9yIHRoaXMg
c2xlZXAgc2l0ZT8KSW4gbXkgdW5kZXJzdGFuZGluZywgYmFja2VuZCBsZWF2aW5nIGNsb3NlZC91
bmtub3cgc3RhdGUgY2FuIHRyaWdnZXIgdGhlIAp3YWtldXBzLiBJIG1lYW4gdG8gbWFrZSBzdXJl
IGJvdGggc2lkZXMgYXJlIHJlYWR5IGZvciBjcmVhdGluZyBjb25uZWN0aW9uLgoKVGhhbmtzLApM
aWFuZwo+Cj4gVGhhbmsgeW91Lgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KPiBYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Cj4gWGVuLWRldmVsQGxpc3Rz
LnhlbnByb2plY3Qub3JnCj4gaHR0cHM6Ly9saXN0cy54ZW5wcm9qZWN0Lm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3hlbi1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fClhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2pl
Y3Qub3JnCmh0dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4t
ZGV2ZWw=
