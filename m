From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [RFC PATCH 0/4] Add missing default labels to
 switch statements
Date: Tue, 26 Feb 2019 04:14:39 -0700
Message-ID: <5C751F9F020000780021A44C@prv1-mh.provo.novell.com>
References: <20190222095721.24764-1-andr2000@gmail.com>
 <6e297f93-0c34-18df-63bb-6ef77b0615f3@citrix.com>
 <a30ca582-0993-9652-112e-467f49605405@arm.com>
 <f3438c56-1e7c-88fa-fb0e-b770eccf6d88@gmail.com>
 <bbc8f1bc-c8dd-6784-fbe4-0667127d37af@arm.com>
 <63101f28-a1ad-bffd-158a-c7e1380f6e18@gmail.com>
 <547c3711-02a3-9071-5bb1-494ca45eb4a6@arm.com>
 <alpine.DEB.2.10.1902221253050.30151@sstabellini-ThinkPad-X260>
 <b405a7ae-174f-c8d9-41cc-ec511fb69c77@citrix.com>
 <5C73D41B0200007800219C82@prv1-mh.provo.novell.com>
 <CAFLBxZYmBdR7Mte6i75Nn_a7rYx+0eh88mE3ukBb3tZNNVnZ7Q@mail.gmail.com>
 <alpine.DEB.2.10.1902250942570.4000@sstabellini-ThinkPad-X260>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <SRS0=VxGf=RB=suse.com=jbeulich@srs-us1.protection.inumbo.net>)
 id 1gyahB-0003dW-0C
 for xen-devel@lists.xenproject.org; Tue, 26 Feb 2019 11:14:45 +0000
In-Reply-To: <alpine.DEB.2.10.1902250942570.4000@sstabellini-ThinkPad-X260>
Content-Disposition: inline
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: Stefano Stabellini <sstabellini@kernel.org>
Cc: Artem Mygaiev <artem_mygaiev@epam.com>, "andrii_anisov@epam.com" <andrii_anisov@epam.com>, oleksandr_andrushchenko@epam.com, Oleksandr Andrushchenko <andr2000@gmail.com>, Andrew Cooper <andrew.cooper3@citrix.com>, George Dunlap <dunlapg@umich.edu>, Julien Grall <julien.grall@arm.com>, xen-devel <xen-devel@lists.xenproject.org>
List-Id: xen-devel@lists.xenproject.org

Pj4+IE9uIDI1LjAyLjE5IGF0IDE4OjQ3LCA8c3N0YWJlbGxpbmlAa2VybmVsLm9yZz4gd3JvdGU6
Cj4gQWxzbywgYWxsIHRoZSBhbHRlcm5hdGl2ZSBzdWdnZXN0aW9ucyBhYm91dCB1c2luZyBjb21w
bGllciBmZWF0dXJlcyB0bwo+IGNoZWNrIHN3aXRjaCBzdGF0ZW1lbnRzIGFyZSBiYXNlZCBvbiB0
aGUgZmFjdCB0aGF0IG9uZSBjYW4gdXNlIHRob3NlCj4gY29tcGlsZXJzLiBJIGRvbid0IHRoaW5r
IHdlIGNhbi9zaG91bGQvd2FudCB0byBtYW5kYXRlIHdoaWNoIGNvbXBpbGVycwo+IGFyZSB1c2Vk
IHdpdGggdGhlIFhlbiBjb2RlYmFzZS4gV2UgZG9uJ3Qgd2FudCB0byBnZXQgaW50byB0aGUgc2l0
dWF0aW9uCj4gd2hlcmUgdGhlIGNvZGUgaXMgInNhZmUiIG9ubHkgd2hlbiBpdCBpcyBidWlsdCB3
aXRoIGdjYy4KCkknbSBub3Qgc3VyZSBJIGFncmVlLCBhbmQgSSdtIHN1cmUgSSBkb24ndCBmdWxs
eSBhZ3JlZTogVGhlcmUgYXJlIHdheSB0b28KbWFueSBleHRlbnNpb25zIHdlIHVzZSB0aGF0IHdl
IGFyZSBnb2luZyB0byBiZSBhYmxlIHRvIHNheSAiWGVuIGJ1aWxkcwpmaW5lIHdpdGggeW91ciBj
b21waWxlciBvZiBjaG9pY2UiLiBZZXQgYnVpbGRpbmcgYXQgYWxsIGlzIGJyb2FkZXIgdGhhbiBi
dWlsZGluZwoic2FmZWx5Ii4KCkphbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpYZW4tZGV2ZWwgbWFpbGluZyBsaXN0Clhlbi1kZXZlbEBsaXN0cy54
ZW5wcm9qZWN0Lm9yZwpodHRwczovL2xpc3RzLnhlbnByb2plY3Qub3JnL21haWxtYW4vbGlzdGlu
Zm8veGVuLWRldmVs
