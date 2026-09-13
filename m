Return-Path: <xen-devel-bounces@lists.xenproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.xenproject.org (lists.xenproject.org [192.237.175.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB6BCC88E5C
	for <xen-devel@archiver.kernel.org>; Sun, 13 Sep 2026 15:27:45 +0000 (UTC)
Received: from list by lists.xenproject.org with outflank-mailman.1419977.1646680 (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5m6r-0002xV-BO; Sun, 13 Sep 2026 15:27:13 +0000
X-Outflank-Mailman: Message body and most headers restored to incoming version
Received: by outflank-mailman (output) from mailman id 1419977.1646680; Sun, 13 Sep 2026 15:27:13 +0000
Received: from localhost ([127.0.0.1] helo=lists.xenproject.org)
	by lists.xenproject.org with esmtp (Exim 4.92)
	(envelope-from <xen-devel-bounces@lists.xenproject.org>)
	id 1x5m6r-0002xN-6V; Sun, 13 Sep 2026 15:27:13 +0000
Received: by outflank-mailman (input) for mailman id 1419977;
 Sun, 13 Sep 2026 15:27:11 +0000
Received: from mx.expurgate.net ([194.145.224.10])
 by lists.xenproject.org with esmtp (Exim 4.92)
 (envelope-from <brchuckz@aol.com>) id 1x5m6p-0002xH-J3
 for xen-devel@lists.xenproject.org; Sun, 13 Sep 2026 15:27:11 +0000
Received: from mx.expurgate.net (helo=localhost) by mx.expurgate.net with esmtp
 id 1x5m6p-0078vD-07
 for xen-devel@lists.xenproject.org; Sun, 13 Sep 2026 17:27:11 +0200
Received: from [10.42.69.2] (helo=localhost)
 by localhost with ESMTP (eXpurgate MTA 0.9.1)
 (envelope-from <brchuckz@aol.com>)
 id 6aa6c0c8-bab6-0a2a0a5309dd-0a2a4502ccc8-4
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 17:27:09 +0200
Received: from [98.137.65.30] (helo=sonic315-54.consmr.mail.gq1.yahoo.com)
 by tlsNG-720697.mxtls.expurgate.net with ESMTPS (eXpurgate 4.57.1)
 (envelope-from <brchuckz@aol.com>)
 id 6aa6c0cc-6ca4-0a2a45020019-6289411e9afd-3
 for <xen-devel@lists.xenproject.org>; Sun, 13 Sep 2026 17:27:09 +0200
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic315.consmr.mail.gq1.yahoo.com with HTTP; Sun, 13 Sep 2026 15:27:07 +0000
Received: by hermes--production-bf1-54b5569bdc-2n8f4 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 91fea8749ccdd05d639ef192ab9d70cc; 
 Sun, 13 Sep 2026 15:27:01 +0000 (UTC)
X-BeenThere: xen-devel@lists.xenproject.org
List-Id: Xen developer discussion <xen-devel.lists.xenproject.org>
List-Unsubscribe: <https://lists.xenproject.org/mailman/options/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=unsubscribe>
List-Post: <mailto:xen-devel@lists.xenproject.org>
List-Help: <mailto:xen-devel-request@lists.xenproject.org?subject=help>
List-Subscribe: <https://lists.xenproject.org/mailman/listinfo/xen-devel>,
 <mailto:xen-devel-request@lists.xenproject.org?subject=subscribe>
Errors-To: xen-devel-bounces@lists.xenproject.org
Precedence: list
Sender: "Xen-devel" <xen-devel-bounces@lists.xenproject.org>
Authentication-Results: eu.smtp.expurgate.cloud; dkim=pass header.s=a2048 header.d=aol.com header.i="@aol.com" header.h="Date:Subject:From:To:Cc:References:In-Reply-To"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048; t=1789313227; bh=EoozB3bjfG8FjgjVi4Pa/GkHfnOoiVK3GJ3j78pUtlM=; h=Date:Subject:From:To:Cc:References:In-Reply-To:From:Subject:Reply-To; b=OMyUKa8qj5GPyTYU7DLq0OG3dqOV8t/G4lXIPD9/qEYgQ0xAbDVUMjvbaxReQGtuPc7q4aqcVcVvfUl1t7xm4eVoGdhQXAS6ITUphGOKsyF7/F7AqtrgTKZx9GIj4OaIZGQp/DqUPetufGDHAuZE2Boe+oQRB10Q5tRcJD+WrAyt2XPCPJsNkdekU3VzwBvzX6HrPyGH2AgsweXcmF74drvTgfFvHLim2P8L+d1BcJ/zrx+JeO7nI1IgTkE7HwMFPZBKtKc7Hj9M5vNzq318TWwv6MwWMrDzVqV10WUv+KfleykiBsyfCiEDfSZFPQO8ruu9dwseVA0S9fH9BaPxrw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1789313227; bh=3LYiOU9aWUqZigvOf7Rx6CBO8oV+QOSiG0lEliFr41r=; h=X-Sonic-MF:Date:Subject:From:To:From:Subject; b=Oo5AMM7BnYSdzGbkulCiMmBiIg58t8Xp6DqfvclndbJcweu+oOxjt7qUMHplAhU8TOzSV4EUjpTTWiYPIYPSZb+o+7Ox7DVYsRcKzTPWaGtaz8Av/uYcsBhMJ4FHK6a+TEczAughhB29qPHKmwADMftIShlZGBtSz0dtAJmmQ/eJl0p3rY/vSBCWy6ub7NSFQ5hEP66lGgkmItOuSqip3eHGS+ruLzo0SktbXL46XqUsO5d695bA7iTDpOa9WcOAdF6UEUxalIx/sg6vU5cNTURhOYITEpjt+L1b0OPSD/CTecdz+NoIIWc7qV0KyWTNgCEpM0lgRQVrXFw3LQgdWg==
X-YMail-OSG: WzcBx6wVM1mw9QBTOZuLShFQ8heTw6XAbjOSBFxbuw0T41tT9VorOGZZ5av8jr4
 8vhQmVOI7mfd3exdtxwyW0u4vqK9NbbF1mmJhb_s6DVV7N7fEwkcJFNMViL4aVKgSurkauUCWkIC
 AWlzV8XJBPmrqAH2isFv0asfObw96wPlAa5Xsh8KN83Nq6kaYUp.KLKY8QMbRXsZaUB7WHUbHmBB
 UelyRxJ14jQawoTQFSiJzpXyAWNqjZEzC8SknYNiCHEUAuonnOYRzUH8ZXix_6AkCSMyLsJkunHS
 vqSBHUmauVdO9j5Nab8wB8rJrtVFp8ZOqg1HdOIVb_yG3gW9etzgMMH8PCnB.9c8FBpz8MRQZUZr
 4tZ7meJ0JIGXIhYCUIwrtCJ3QiMTlzg6GCSTtAkblNHRPk9xviRbgaAC7D3QuD9kKMJM.Z43PXu1
 f1fDndkDardsrQ70o975kpi9FpUv13w3_Raj8h3yemx4uSNZFdKWKzoMOyLCa7yiSb89oxnkdt1x
 CS.ScG_6p.N5n.c3ifHvoBnCHrJQxX9oZDNCVC_UPUddQ8Glm8tGOpEawgO0CS7XaTVJtg_0nB.z
 X3UNqmIeJ7PcN1ZPMpl86tEh7udEVyGx.NtgsiDw3hnbNGFsgDr_S1S4tf1.9USdlpp7QZyL8KQq
 AQG.1YvrJU9znUTZUR.vdsHLh7mdCLa0QvRYpEzD_l90iH6diiOlcspVg6_.ITEcgvAtSwIZxbO4
 Ewm8HWKJmtPxpqzyd3_LJhJLAAg3Ol9KskDzF92ZHUsZbaoZtc5GjM82jyJvBIs7kfeMuLOAGs1b
 tXrnq5FtTsYFwD0EwwXlqVmsHroLokaozEGiCjCA6rMcd.J_DoL._BK41_uCg.p86LpsoXqj5f7D
 ucpgHSOAtpucDhrk8o.Rtnhsc_HbNNh4v30Z5Ic.VcC6P45owNtn5fWrOSv1vGjshB.paDAIA9tD
 F.Nfgfli4hxzX5ODsVlMXCr6Ku_pEt7oQNOcyG2MP_55HK3K2LqOY5VATVDbw46BGAN8z9EyitBu
 lxIZH5_LmnMBXGJL_PEFhW4c.DE2NFnZ80AdJkDd3vdPkFHRZAfwcf_z.GQoqVg8BOaNxqn3CX9t
 KR27sL1U8FSmjq0aCXTMFZ2FdIUR_DttKZ5W0DoVLU3bZ51nuQ.sVRm.nQyGsCDxzXIFXRTJZpzR
 5uq0JZ4q.JkJ9FsM1pggqDxS4qCUeawKyTC2slwft5n6Q5pGgwWJ9wuqIXf30nmr6rxw3FnY2Yqz
 x2rmwZjelYI7Vl868mk0fhgpkDbpZ6ay30nXl9cgo9NHTq9y6MY4XlJb5G7Qzi.5_WJS34WcLhtj
 .LBcRgRPza_XYCp6xQZ1J8E_fKk1Fn_SNkt3niUCTrqfyMMpm9qcOwjhc3Aqvu2tnuLMJzJlVcRl
 iJEW2negtUqMwWlg8fwYk0yAArrYtTHin5IjwLAQlFR.CzvqPNGwln5jMBJnW77k5zaPWy.pbG1T
 CiaBqXNg9f_KcMFMgKwwxNA8PRgrCx3y6jtuRal.TGY.TQDtkVdJhtBzg8inwi_M7RpBXPRdYNvx
 LCON_W0ZEJImr.Z.T_iOndgydDO8VaAAF4kYFgjABpAuLMqPazSFNhqyr5chl_5p9zjzLrT6.WTP
 eIcQX58YOENh.UHl1kf_a_3HjQFmdeQ2qSUM_LXiCYRH.V7ERpVKEHu_citt2Wq3HOXgq.M4WAix
 ikTjgY1FhyvCXhzS_oeDdrLuQeebwLPzEAGfqWxzkhUo5gskHIyWFjpDX0eN2psM.eqWKYZ9N5Wd
 TLHFPWXJyGFz_WuiotPxbNRH5Hb4eZUCxFeatWJelnhJpkKKY8siZyGX7uB7hAJZ4RD6go9785YZ
 uJRrISRlnSp1xwN_92MW_oCdqyOV.ZkvjM1bG7KJjndHTUotn3b.ILej7aQdgpUPGVj1VHrgXVWZ
 y2qY9XWR9ln1TX_TUYl6jAqz5ROSe6IhFioI3_mq2OvJjBjPTiuXrUkrwIqDv5h7tCrxt21N_vSY
 bsdfmxSyIIK8AwBmrDU9ZVTU_3F1XL1XksR8PCTbeKMa73j3v2dADYhVwPwBs3x2quSbe1yv5Jfy
 l_4qH73bk4PZNAgU7UlzoXa7Y4lvEb0iZSzlFGg2NT.eDEYzDRKf8S.qXY88cNWd4v6e4u9xsSs5
 rbDYzsqbQ72fgO52p46uElBNCDXWG04qFZ5PqiqJg48Nb5CGkFpgPc9dPvDUU96QQt903Y7nRCXI
 bzyewVej5r.nNa8IHkZsO.CqDY_TUhX4MIYB91f7I84W8AQ--
X-Sonic-MF: <brchuckz@aol.com>
X-Sonic-ID: 0806e39c-1374-481f-aa83-482c050ccefd
Message-ID: <292f5e2f-377d-498f-9966-d000468f8a19@aol.com>
Date: Sun, 13 Sep 2026 11:27:00 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/7] xen/igd: fixes for Intel IGD passthrough
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, xen-devel@lists.xenproject.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony PERARD <anthony@xenproject.org>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Tomita Moeko <tomitamoeko@gmail.com>
References: <20260911072453.46256-1-brchuckz.ref@aol.com>
 <20260911072453.46256-1-brchuckz@aol.com>
Content-Language: en-US
In-Reply-To: <20260911072453.46256-1-brchuckz@aol.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Mailer: WebService/1.1.26525 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.aol
X-purgate-ID: tlsNG-720697/1789313229-F26B72AC-D991EE05/0/0
X-purgate-type: clean
X-purgate-size: 657

On 9/11/2026 3:24 AM, Chuck Zmudzinski wrote:
> Please note that Patch 6 of this series requires a patch to hvmloader of
> Xen for the new support to take effect. Also please note that earlier
> versions of the patch to hvmloader are not compatible with this version
> of Patch 6. Please look for v3 of the "tools/hvmloader: implement Intel IGD
> extended VBT support" patch that will be posted shortly to both the xen-devel
> and qemu-devel mailing lists.

The patch to hvmloader required by Patch 6 of this patch series has been
upgraded to v4 and is available here:

https://lore.kernel.org/xen-devel/20260913032724.62438-2-brchuckz@aol.com/

