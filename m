From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH 1/2] xen: fix race in xen_qlock_wait()
Date: Mon, 01 Oct 2018 02:54:13 -0600
Message-ID: <5BB1E0B502000078001ED124__23166.6799787947$1538383989$gmane$org@prv1-mh.provo.novell.com>
References: <20181001071641.19282-1-jgross@suse.com>
 <20181001071641.19282-2-jgross@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from all-amaz-eas1.inumbo.com ([34.197.232.57])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=ngkg=mn=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1g6ty8-0003z1-CV
 for xen-devel@lists.xenproject.org; Mon, 01 Oct 2018 08:54:20 +0000
In-Reply-To: <20181001071641.19282-2-jgross@suse.com>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Juergen Gross <jgross@suse.com>
Cc: hpa@zytor.com, Peter Zijlstra <peterz@infradead.org>, the arch/x86 maintainers <x86@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, mingo@redhat.com, Borislav Petkov <bp@alien8.de>, longman@redhat.com, xen-devel <xen-devel@lists.xenproject.org>, tglx@linutronix.de, Boris Ostrovsky <boris.ostrovsky@oracle.com>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDAxLjEwLjE4IGF0IDA5OjE2LCA8amdyb3NzQHN1c2UuY29tPiB3cm90ZToKPiBJbiB0
aGUgZm9sbG93aW5nIHNpdHVhdGlvbiBhIHZjcHUgd2FpdGluZyBmb3IgYSBsb2NrIG1pZ2h0IG5v
dCBiZQo+IHdva2VuIHVwIGZyb20geGVuX3BvbGxfaXJxKCk6Cj4gCj4gQ1BVIDE6ICAgICAgICAg
ICAgICAgIENQVSAyOiAgICAgICAgICAgICAgICAgICAgICBDUFUgMzoKPiB0YWtlcyBhIHNwaW5s
b2NrCj4gICAgICAgICAgICAgICAgICAgICAgIHRyaWVzIHRvIGdldCBsb2NrCj4gICAgICAgICAg
ICAgICAgICAgICAgIC0+IHhlbl9xbG9ja193YWl0KCkKPiAgICAgICAgICAgICAgICAgICAgICAg
ICAtPiB4ZW5fY2xlYXJfaXJxX3BlbmRpbmcoKQoKRG9lc24ndCB0aGUgbGFzdCBsaW5lIGFib3Zl
IC4uLgoKPiBmcmVlcyB0aGUgbG9jawo+IC0+IHhlbl9xbG9ja19raWNrKGNwdTIpCgouLi4gbmVl
ZCB0byBiZSBiZWxvdyBoZXJlPwoKPiB0YWtlcyBsb2NrIGFnYWluCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB0cmllcyB0byBnZXQgbG9jawo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLT4gKmxvY2sg
PSBfUV9TTE9XX1ZBTAo+ICAgICAgICAgICAgICAgICAgICAgICAgIC0+ICpsb2NrID09IF9RX1NM
T1dfVkFMID8KPiAgICAgICAgICAgICAgICAgICAgICAgICAtPiB4ZW5fcG9sbF9pcnEoKQo+IGZy
ZWVzIHRoZSBsb2NrCj4gLT4geGVuX3Fsb2NrX2tpY2soY3B1MykKPiAKPiBBbmQgY3B1IDIgd2ls
bCBzbGVlcCBmb3JldmVyLgo+IAo+IFRoaXMgY2FuIGJlIGF2b2lkZWQgZWFzaWx5IGJ5IG1vZGlm
eWluZyB4ZW5fcWxvY2tfd2FpdCgpIHRvIGNhbGwKPiB4ZW5fcG9sbF9pcnEoKSBvbmx5IGlmIHRo
ZSByZWxhdGVkIGlycSB3YXMgbm90IHBlbmRpbmcgYW5kIHRvIGNhbGwKPiB4ZW5fY2xlYXJfaXJx
X3BlbmRpbmcoKSBvbmx5IGlmIGl0IHdhcyBwZW5kaW5nLgo+IAo+IENjOiBzdGFibGVAdmdlci5r
ZXJuZWwub3JnIAo+IENjOiBXYWltYW4uTG9uZ0BocC5jb20gCj4gQ2M6IHBldGVyekBpbmZyYWRl
YWQub3JnIAo+IFNpZ25lZC1vZmYtYnk6IEp1ZXJnZW4gR3Jvc3MgPGpncm9zc0BzdXNlLmNvbT4K
ClBhdGNoIGl0c2VsZgpSZXZpZXdlZC1ieTogSmFuIEJldWxpY2ggPGpiZXVsaWNoQHN1c2UuY29t
PgoKSmFuCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
