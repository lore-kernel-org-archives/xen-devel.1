From: Juergen Gross <jgross@suse.com>
Subject: TLB flushing
Date: Tue, 20 Mar 2018 09:50:29 +0100
Message-ID: <0f224e94-2513-3146-d418-8789a5e1369b@suse.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <xen-devel-bounces@lists.xenproject.org>
Received: from us1-rack-dfw2.inumbo.com ([104.130.134.6])
 by lists.xenproject.org with esmtp (Exim 4.89)
 (envelope-from <srs0=vyyo=gk=suse.com=jgross@srs-us1.protection.inumbo.net>)
 id 1eyCya-0000qD-OU
 for xen-devel@lists.xenproject.org; Tue, 20 Mar 2018 08:50:36 +0000
Content-Language: en-US
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
To: xen-devel <xen-devel@lists.xenproject.org>, Jan Beulich <JBeulich@suse.com>, Andrew Cooper <andrew.cooper3@citrix.com>, "George.Dunlap@eu.citrix.com" <George.Dunlap@eu.citrix.com>
List-Id: xen-devel@lists.xenproject.org

V2hpbGUgaHVudGluZyBhIHN0cmFuZ2UgYnVnIGluIG15IFBDSUQgcGF0Y2ggc2VyaWVzIGhpbnRp
bmcgYXQgc29tZQpUTEIgaW52YWxpZGF0aW9uIHByb2JsZW0gSSBkaXNjb3ZlcmVkIGEgcGllY2Ug
b2YgY29kZSBsb29raW5nIHJhdGhlcgpmaXNoeSB0byBtZS4KCklzIGl0IGNvcnJlY3QgZm9yIG5l
d190bGJmbHVzaF9jbG9ja19wZXJpb2QoKSB0byB1c2UgRkxVU0hfVExCIGluc3RlYWQKb2YgRkxV
U0hfVExCX0dMT0JBTD8KCldoaWxlIG5vdCBiZWluZyBhIHByb2JsZW0gaW4gY3VycmVudCBjb2Rl
IGFzIGJvdGggd2lsbCBmbHVzaCBhbGwgVExCCmVudHJpZXMgbXkgc2VyaWVzIHdpbGwgY2hhbmdl
IHRoYXQgYnkgdXNpbmcgaW52cGNpZCB0byBmbHVzaCBvbmx5IHRoZQpub24tZ2xvYmFsIGVudHJp
ZXMgaWYgRkxVU0hfVExCX0dMT0JBTCB3YXNuJ3Qgc2V0LgoKSSBjYW4gc2VuZCBhIHBhdGNoIGlm
IGFueW9uZSBjYW4gY29uZmlybSB0aGF0IHVzaW5nIEZMVVNIX1RMQiBvbmx5IGlzCndyb25nLgoK
Ckp1ZXJnZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Clhlbi1kZXZlbCBtYWlsaW5nIGxpc3QKWGVuLWRldmVsQGxpc3RzLnhlbnByb2plY3Qub3JnCmh0
dHBzOi8vbGlzdHMueGVucHJvamVjdC5vcmcvbWFpbG1hbi9saXN0aW5mby94ZW4tZGV2ZWw=
